package starlingview
{
	import flash.display.Stage;
	
	import starling.core.Starling;
	import starling.events.Event;
	/**
	 * starling 初始器
	 * @author zhouhua
	 * 
	 */	
	public class StarlingIniter 
	{
		
		
		
		public function StarlingIniter(instage:Stage,backfun:Function)
		{
			super();
			
			initStarling(instage);
			
			backRootfun=backfun;
		}
		
		
		private var gameinstance:StarlingGameContext;
		
		private function initStarling(instage:Stage):void
		{
			// TODO Auto Generated method stub
			var _starling:Starling = new Starling(StarlingGameContext, instage);
			_starling.showStats = true;
			_starling.start();
			_starling.addEventListener(starling.events.Event.ROOT_CREATED,onRootcreat)
			
		}		
		
		/**
		 *starling 底层启动完毕 
		 * @param e
		 * 
		 */		
		private function onRootcreat(e:starling.events.Event):void
		{
			// TODO Auto Generated method stub
			gameinstance=StarlingGameContext.instance;
			
				if(backRootfun!=null){
					backRootfun()
				}
				
		}
		
		
		private var backRootfun:Function;
		
	
		
		
	}
}