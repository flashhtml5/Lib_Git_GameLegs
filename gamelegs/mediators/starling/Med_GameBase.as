package gamelegs.mediators.starling
{
	import R2Event.Robert2CommandEvent;
	
	import gameapi.statics.Static_Event;
	
	import mediators.base.MediatorSGameBase;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	import viewsStarling.base.SwfUIBaseForGameLegs;
	
	public class Med_GameBase extends MediatorSGameBase
	{
		public function Med_GameBase()
		{
			super();
		}
		/**
		 *一个视图资源的id 
		 */		
		public var viewid:String;
		
		/**
		 *注册事件类型 
		 */		
		private var regDataChangTypes:Array;
		
		override protected function initData():void
		{
			// TODO Auto Generated method stub
			regDataChangTypes=[];
			
			super.initData();
			
		}
		
		protected function regDataChangedEventHookType(eventype:String):void{
			
			if(regDataChangTypes.indexOf(eventype)==-1){
				regDataChangTypes.push(eventype);
			}
		}
		
		override public function initContextEvent():void
		{
			// TODO Auto Generated method stub
			super.initContextEvent();
			
			//			addContextListener(Static_Event.EVENT_VIEWMODULE_CREATE,onCreateView)
			addContextListener(Static_Event.EVENT_VIEW_CHANGE,onView_Change);
			addContextListener(Static_Event.EVENT_DATA_CHANGE,onData_Change);
			
		}
		
		override protected function onAddToStage(e:Event):void
		{
			// TODO Auto Generated method stub
			super.onAddToStage(e);
			
			initContextEvent();
			
		}
		
		override public function set viewbase(value:Sprite):void
		{
			// TODO Auto Generated method stub
			super.viewbase = value;
			
			
			
		}
		
		
		/**
		 *当前是否只是移动层次,不清理注册事件 
		 */		
		public var bMovingChild:Boolean;
		
		
		
		
		override protected function onRemoveStage(e:Event):void
		{
			// TODO Auto Generated method stub
			//			trace("onRemoveStage")
			if(bMovingChild)return;
			removeContextListener(Static_Event.EVENT_VIEW_CHANGE,onView_Change);
			removeContextListener(Static_Event.EVENT_DATA_CHANGE,onData_Change);
			
			
		}
		
		
		private function onView_Change(e:Robert2CommandEvent):void
		{
			// TODO Auto Generated method stub
			var eventviewid:String=e.data[0];
			
			if(eventviewid==this.viewid){
				
				
				doDirectViewChangeEvent(e.data);
				
			}
		}	
		
		/**
		 *处理本视图元件的事件, 注意数据是原始数据 包含了	[0]元件id 
		 * 进入本方法的事件是己经过滤过的
		 * @param data
		 * 
		 */		
		protected function doDirectViewChangeEvent(dataay:Array):void
		{
			// TODO Auto Generated method stub
			
		}		
		/**
		 *当事件触发时 
		 * @param e
		 * 
		 */		
		private function onData_Change(e:Robert2CommandEvent):void
		{
			// TODO Auto Generated method stub
//			var eventtype:String=e.data[0];
//			var regtype:String=e.data[1];
			if(binited==false)return;
			
			if(regDataChangTypes.indexOf(e.data[0])==-1)return;
			
			doRegisteredDataChangeEvent(e.data[0],e.data);
			
			
		}
		
		override public function initialize():void
		{
			// TODO Auto Generated method stub
			if(viewid==null){
				viewid=viewbase.name;
			}
			super.initialize();
			
		}
		
		
		
		/**
		 *处理注册过的事件类型 
		 * @param regtype
		 * @param dataay
		 * 
		 */		
		protected function doRegisteredDataChangeEvent(regtype:String, dataay:Array):void
		{
			// TODO Auto Generated method stub
			
		}	
		
		
		/**
		 *设置是否可点击 
		 * @param selfenable
		 * @param groupenable
		 * 
		 */		
		public function settouchEanble(selfenable:Boolean,singlegroup:Boolean):void{
			
			viewbase.touchable=selfenable;
			viewbase.touchGroup=singlegroup
		
		}
		
		
		/**
		 *向viewbase增加一个显示子对像 通用元件id生成 
		 * @param mcid
		 * @return 
		 * 
		 */		
		protected function addUImcto_inj_view(mcid:String):SwfUIBaseForGameLegs{
			
			
			var uimc:SwfUIBaseForGameLegs=new SwfUIBaseForGameLegs();
			(viewbase as SwfUIBaseForGameLegs).addChildByName(uimc,mcid);
			return uimc;
		}
		
		
	}
}