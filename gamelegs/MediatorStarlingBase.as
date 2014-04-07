package gamelegs
{
	
	
	import flash.events.EventDispatcher;
	import flash.utils.setTimeout;
	
	import R2Event.Robert2CommandEvent;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;

	public class MediatorStarlingBase
	{
		public function MediatorStarlingBase()
		{
			evedisp=GameLegs.evedisp;
		}
		
		protected var evedisp:EventDispatcher;
		
		private var _viewbase:Sprite;
		
		
		
		public function initialize():void{
			
			initData();
			
			initContextEvent();
			
			initViewEvent();
			
			
			
		}
		
		protected function initData():void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function get viewbase():Sprite
		{
			return _viewbase;
		}

		public function set viewbase(value:Sprite):void
		{
			_viewbase = value;
			
			this["inj_view"]=_viewbase;
			
			initialize();
		}
		
		
		public function initContextEvent():void{
			
			
		}
		
		public function initViewEvent():void{
			
			
			addViewListener(Event.ADDED_TO_STAGE,onAddToStage);
			addViewListener(Event.REMOVED_FROM_STAGE,onRemoveStage);
			
		}
		
		protected function onRemoveStage(e:Event):void
		{
			// TODO Auto Generated method stub
//			trace("onRemoveStage")
		}
		
		protected function onAddToStage(e:Event):void
		{
			// TODO Auto Generated method stub
//			trace("onAddToStage")
		}
		
		
		
		public function getViewMediator(childdisp:DisplayObject,aliasname:String=null):MediatorStarlingBase{
			
			
			
			return GameLegs.getStarlingMediator(childdisp,aliasname);
			
		}
		
		
		protected function addContextListener(EventType:String, EventCallFun:Function):void
		{
			// TODO Auto Generated method stub
			//			EventType=EventType.toUpperCase();
			GameLegs.addEventFunction(EventType,EventCallFun);
		}
		
		
		protected function addViewListener(EventType:String, EventCallFunction:Function):void
		{
			// TODO Auto Generated method stub
			_viewbase.addEventListener(EventType,EventCallFunction);
		}
		
		public function dispEventType(evetype:String,data:Array,delay:int=0):void{
		
			var ve:Robert2CommandEvent=new Robert2CommandEvent(evetype,data);
			if(delay==0){
				evedisp.dispatchEvent(ve);
			}
			else{
				setTimeout(evedisp.dispatchEvent,delay,ve);
			}
		}
		
	}
}