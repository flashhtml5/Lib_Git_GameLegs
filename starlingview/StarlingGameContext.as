package starlingview
{
	import flash.events.IEventDispatcher;
	
	public class StarlingGameContext extends StarlingGameLegsSpriteBase
	{
		
		public var evedisp:IEventDispatcher;
		
		public var mainsp:StarlingGameLegsSpriteBase;
		
		
		
		
		public function StarlingGameContext()
		{
			super();
			
//			this.addEventListener(starling.events.Event.ADDED,onAddStrling);
		}
		
		
		public static var instance:StarlingGameContext;

		
		
		
		
		
		
		
		
		
		
	}
}