package gamelegs
{
	
	
	import flash.events.EventDispatcher;
	
	import R2Event.Robert2CommandEvent;
	
	
	import starling.display.Sprite;

	public class MediatorStarlingBase
	{
		public function MediatorStarlingBase()
		{
			evedisp=GameLegs.evedisp;
		}
		
		protected var evedisp:EventDispatcher;
		
		private var _viewbase:Sprite;
		
		
		
		public function initialize():void{
			
			
			initContextEvent();
			
			initViewEvent();
			
			
			afterinitEvent();
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
			
			
		}
		
		public function afterinitEvent():void{
		
		
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
		
		public function dispEventType(evetype:String,data:Array):void{
		
			var ve:Robert2CommandEvent=new Robert2CommandEvent(evetype,data);
			
			evedisp.dispatchEvent(ve);
		}
		
	}
}