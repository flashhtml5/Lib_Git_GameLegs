package starlingview
{
	import gamelegs.GameLegs;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 *starling 基类 
	 * @author zhouhua
	 * 
	 */	
	public class StarlingGameLegsBase extends StarlingGameBase
	{
		public function StarlingGameLegsBase()
		{
			super();
		}
		
		
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			// TODO Auto Generated method stub
			GameLegs.getStarlingMediator(child);
			return super.addChild(child);
		}
		
		
		
		
		
		
	}
}