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
	public class StarlingGameLegsSpriteBase extends StarlingGameSpriteBase
	{
		public function StarlingGameLegsSpriteBase()
		{
			super();
		}
		
		
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			// TODO Auto Generated method stub
			GameLegs.getStarlingMediator(child);
			return super.addChild(child);
		}
		
		
		/**
		 *同时传入对像及名字 方便mediator 
		 * @param child
		 * @param name
		 * @return 
		 * 
		 */		
		public function addChildByName(child:DisplayObject,name:String):DisplayObject{
		
			child.name=name;
			
			GameLegs.getStarlingMediator(child,name);
			
			return super.addChild(child);
			
		}
		
		
		
		
	}
}