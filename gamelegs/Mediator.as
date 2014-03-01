package gamelegs
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.getTimer;
	
	import R2Event.Robert2CommandEvent;
	
	import UI.Core.ViewBase;
	import UI.Core.ViewBaseEvent;
	
	public class Mediator extends EventDispatcher
	{
		protected var evedisp:EventDispatcher;
		
		private var _viewbase:DisplayObject;
		
		public function Mediator()
		{
			
			evedisp=GameLegs.evedisp;
		}
		
		public function initialize():void{
			var sp:DisplayObject=_viewbase;
			sp.addEventListener(Event.REMOVED_FROM_STAGE,onReStage)
			sp.addEventListener(Event.REMOVED,onRemove)
		
				
			initContextEvent();
			
			initViewEvent();
		}
		
		public function initContextEvent():void{
		
		
		}
		
		public function initViewEvent():void{
			
			
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
		
		public function destroy():void
		{
			
		}
		
		public function postDestroy():void
		{
			
		}
		
		protected function removeViewListener(EventType:String, EventCallFun:Function):void
		{
			// TODO Auto Generated method stub
			
		}
		
		
		protected function dispatch(se:Robert2CommandEvent):void
		{
			// TODO Auto Generated method stub
			GameLegs.evedisp.dispatchEvent(se);
		}

		public function get viewbase():DisplayObject
		{
			return _viewbase;
		}

		public function set viewbase(value:DisplayObject):void
		{
			_viewbase = value;
			
			this["inj_view"]=_viewbase;
			
			regViewEvent();
			
		}
		
		private function regViewEvent():void
		{
			// TODO Auto Generated method stub
			var sp:DisplayObject=_viewbase;
			
			sp.addEventListener(Event.ADDED_TO_STAGE,onStage);
			sp.addEventListener(Event.ADDED,onAdded)
			
		}		
		
		protected function onRemove(event:Event):void
		{
			// TODO Auto-generated method stub
			event.stopPropagation();
			trace(_viewbase.name,"onRemove")
		}
		
		protected function onReStage(event:Event):void
		{
			// TODO Auto-generated method stub
//			trace(_viewbase.name,"onReStage")
			remViewEvent()
		}
		
		protected function onAdded(event:Event):void
		{
			// TODO Auto-generated method stub
//			trace("onAdded 									start:",getTimer())
			event.stopPropagation();
			
			var addedChild:DisplayObject=event.target as DisplayObject;
			
//			trace("Mediator addchild:",addedChild,addedChild.name);
			
			GameLegs.getMediator(addedChild);
//			trace("onAdded 									stop:",getTimer())
			
		}
		
		protected function onStage(event:Event):void
		{
			// TODO Auto-generated method stub
			trace(_viewbase,_viewbase.name,"onStage")
			
			if((_viewbase is ViewBase)&&((_viewbase as ViewBase).bContentCreated==false)){
				
				var backviewfun:Function=function(e:Event):void{
					_viewbase.removeEventListener(ViewBaseEvent.CONTENT_CREATION_COMPLETE,backviewfun);
					
					initialize();
				}
					
				_viewbase.addEventListener(ViewBaseEvent.CONTENT_CREATION_COMPLETE,backviewfun);
				
			}
			else{
			
				initialize();
			
			}
			
			
		}
		
		private function remViewEvent():void{
			var sp:DisplayObject=_viewbase;
			
			sp.removeEventListener(Event.ADDED_TO_STAGE,onStage);
			sp.removeEventListener(Event.ADDED,onAdded)
			sp.removeEventListener(Event.REMOVED_FROM_STAGE,onReStage)
			sp.removeEventListener(Event.REMOVED,onRemove)
		
		}
		
		

	}
}