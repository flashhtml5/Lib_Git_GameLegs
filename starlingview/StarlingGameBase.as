package starlingview
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class StarlingGameBase extends Sprite
	{
		public function StarlingGameBase()
		{
			super();
		}
		
		public function dispatchEventType(etype:String):void{
			
			var se:Event=new Event(etype);
			
			dispatchEvent(se);
		}
	}
}