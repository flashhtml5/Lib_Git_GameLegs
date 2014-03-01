package gamelegs
{
	import flash.events.EventDispatcher;

	public class GameLegsConfig
	{
		protected var dispatcher:EventDispatcher;
		
		protected var context:Context;
		
		public function GameLegsConfig()
		{
			context=GameLegs.context;
			dispatcher=GameLegs.evedisp;
			
//			trace(GameLegs.context,context);
			 
			configure();
		}
		 
		public function configure():void
		{
			 
			 
		}
	}
}