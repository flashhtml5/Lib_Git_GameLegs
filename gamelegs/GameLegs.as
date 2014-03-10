package gamelegs
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.getQualifiedClassName;
	
	import Ds.HashMap;
	
	import R2Command.Robert2Command;
	
	import R2Event.Robert2CommandEvent;
	
	import gamelegs.utils.ClassUtils;
	

	public class GameLegs
	{
		public function GameLegs()
		{
		}
		
		public static function init():void{
		
			map_inject=new HashMap();
			map_mediator=new HashMap();
			map_command=new HashMap();
			map_function=new HashMap();
			
			map_displaymediator=new HashMap();
			
		}
		
		public static var evedisp:EventDispatcher;
		public static var context:Context;
		
		private static var map_inject:HashMap;
		private static var map_mediator:HashMap;
		private static var map_command:HashMap;
		private static var map_function:HashMap;
		
		private static var map_displaymediator:HashMap;
		
		public static function addinject(injectClass:Class, singClassObj:Object):void
		{
			// TODO Auto Generated method stub
			
			mapay_inject=null;
			
			var classname:String=ClassUtils.getShortClassName(injectClass);
			
			map_inject.add(classname,singClassObj);
		}
		
		public static function getinjectwithshortname(keyname:String):Object{
			
			var classinstance:Object=map_inject.getValue(keyname);
			
			return classinstance;
		}
		
		private static var mapay_inject:Array
		
		
		
		public static function injectinto(toInjectobj:Object):void{
		
			var keys:Array;
			if(mapay_inject){
				keys=mapay_inject
			}
			else{
				keys=map_inject.getKeys();
			}
			
			for (var i:int = 0; i < keys.length; i++) 
			{
				var keyname:String=keys[i];
				var injectname:String="inj_"+keyname;
				
				if(toInjectobj.hasOwnProperty(injectname)){
					
					var savedinjectObj:Object=getinjectwithshortname(keyname);
					
					injectinto(savedinjectObj);
					
					toInjectobj[injectname]=savedinjectObj;
				}
				
			}
			
			
			
		}
		
		public static function addMediator(displayClass:Class, mediatorClass:Class):void
		{
			// TODO Auto Generated method stub
			var classname:String=ClassUtils.getShortClassName(displayClass);
			
			map_mediator.add(classname,mediatorClass);
		}
		
		/**
		 *注册或取回mediator 
		 * @param displayobject
		 * @return 
		 * 
		 */		
		public static function getStarlingMediator(displayobject:Object):*{
			
			var med:*;
			
			med=map_displaymediator.getValue(displayobject);
			
			if(med)return med;
			
			var classname:String=ClassUtils.getShortClassName(displayobject);
			
			var classobj:Class=map_mediator.getValue(classname);
			
			
			if(classobj){
				
				med=new classobj();
				
				
				injectinto(med);
				
				med.viewbase=displayobject;
				
				map_displaymediator.add(displayobject,med);
			}
			
			
			return med;
			
		}
		
		/**
		 *注册或取回mediator 
		 * @param displayobject
		 * @return 
		 * 
		 */		
		public static function getMediator(displayobject:DisplayObject):Mediator{
		
			var med:Mediator;
			 
			med=map_displaymediator.getValue(displayobject);
			
			if(med)return med;
			
			var classname:String=ClassUtils.getShortClassName(displayobject);
			
			
			var classobj:Class=map_mediator.getValue(classname);
			
			if(classobj){
				
				med=new classobj();
				
				injectinto(med);
				
				
				med.viewbase=displayobject;
				
				map_displaymediator.add(displayobject,med);
			}
			
			
			return med;
		
		}
		
		public static function addEventFunction(EventType:String, EventFunction:Function):void
		{
			var eventay:Array
			if(map_function.containsKey(EventType)==false){
				eventay=[];
				map_function.add(EventType,eventay);
			}
			else{
				eventay=map_function.getValue(EventType);
			}
			if(eventay.indexOf(EventFunction)==-1){
				eventay.push(EventFunction);
			}
			
			
			evedisp.addEventListener(EventType,receiveFunction);
		}
		
		/**
		 *注册的全局事件回调 
		 * @param event
		 * 
		 */		
		protected static function receiveFunction(e:Robert2CommandEvent):void
		{
			// TODO Auto-generated method stub
			var etype:String=e.type;//.toUpperCase();
			var functionay:Array=map_function.getValue(etype);
			
			if(functionay!=null){
				
				for (var i:int = 0; i < functionay.length; i++) 
				{
					var commandclass:Function=functionay[i];
					
					commandclass(e);
				}
			}
			else{
				
				trace("未注册的方法:",etype)
			}
			
		}
		
		public static function addCommand(EventType:String, CommandClass:Class):void
		{
			// TODO Auto Generated method stub
			var saveEventType:String=EventType.toUpperCase();
			
			var eventay:Array
			if(map_command.containsKey(saveEventType)==false){
				eventay=[];
				
				map_command.add(saveEventType,eventay);
			}
			else{
				eventay=map_command.getValue(saveEventType);
			}
			if(eventay.indexOf(CommandClass)==-1){
				eventay.push(CommandClass);
			}
			
			addinject(CommandClass,null);
			
			evedisp.addEventListener(EventType,receiveEvent);
		}
		
		
		public static function receiveEvent(e:Robert2CommandEvent):void{
		
			var etype:String=e.type.toUpperCase();
			
			var classay:Array=map_command.getValue(etype);
			
			if(classay!=null){
				
				
				for (var i:int = 0; i < classay.length; i++) 
				{
					var commandclass:Class=classay[i];
					
					var commandobject:Robert2Command=new commandclass(null);
					
					commandobject.initeve(e.clone() as Robert2CommandEvent);
					
					injectinto(commandobject);
					
					commandobject.execute();
					
					commandobject.proccSevent();
					
					commandobject.dispose();
					
					
				}
				
			
				
				
			}
			else{
			
				trace("未注册的事件:",etype)
			}
			
			
			
			
		
		}
		
		
		/**
		 *增加别名的注入类 
		 * @param injectname
		 * @param singClassobj
		 * 
		 */		
		public static function addinjectAlians(injectname:String, singClassobj:Object):void
		{
			// TODO Auto Generated method stub
			map_inject.add(injectname,singClassobj);
		}
	}
}