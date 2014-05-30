package gamelegs.mediators.starling
{
	import flash.utils.setTimeout;
	
	import gameapi.statics.Static_Event;
	import gameapi.statics.Static_Type;
	
	import lzm.starling.swf.display.SwfMovieClip;
	import lzm.starling.swf.display.SwfSprite;
	
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	import utils.AlignType;
	
	import viewsStarling.base.EbabyGameScenBase;
	
	public class Med_ScenUIBase extends Med_SwfUIBase
	{
		public function Med_ScenUIBase()
		{
			super();
		}
		
		public var scenid:String;
		
		
		override public function initialize():void
		{
			// TODO Auto Generated method stub
			super.initialize();
//			this.swfassetid="mainUI"
//			this.swfmovieid="mc_shinei"
			this.aligntype=AlignType.leftTop;
			
		}
		
		override public function afterViewInited():void
		{
			// TODO Auto Generated method stub
			beforeScenInited();
			
			super.afterViewInited();
			
			
			
			settouchEanble(true,false);
			
			setTimeout(sendScenInitEvent,1);
		}
		
		protected var bscenopened:Boolean;
		
		/**
		 *发送场景资源准备完成 
		 * 
		 */		
		protected function sendScenInitEvent():void{
		
			dispEventType(Static_Event.EVENT_VIEW_UPDATE,[Static_Type.VIEW_SCENINITED,this.scenid,this.inj_view,this.viewid]);
			
//			scenshow_open();
		}
		
		override public function initContextEvent():void
		{
			// TODO Auto Generated method stub
			super.initContextEvent();
		}
		
		override public function initViewEvent():void
		{
			// TODO Auto Generated method stub
			super.initViewEvent();
			
			
	
			
			
			addViewListener(TouchEvent.TOUCH,onTouchedScenEvent)
			
			
			
			
			
		}
		
		override protected function removeViewListerner():void
		{
			// TODO Auto Generated method stub
			removeViewListener(TouchEvent.TOUCH,onTouchedScenEvent)
		}	
		
		
		
		override protected function onAddToStage(e:Event):void
		{
			// TODO Auto Generated method stub
			super.onAddToStage(e);
			
			/*if(isviewinited){
				scenshow_open();
			}*/	
			
			
		}
		
		override protected function onRemoveStage(e:Event):void
		{
			// TODO Auto Generated method stub
			super.onRemoveStage(e);
			scenshow_close();
//			scenshow_close();
		}
		
		
		
		
		
		
		
		
		/**
		 *场景上的触摸事件 
		 * @param e
		 * 
		 */		
		protected function onTouchedScenEvent(e:TouchEvent):void
		{
			
			
		}
		
		
		
		protected function beforeScenInited():void{
		
			
			layoutSwfUI();
		
//			dispEventType(Static_Event.EVENT_VIEWMODULE_INITED,[scenid]);
			
		}
		
		/**
		 *场景打开后回调 
		 */		
		protected var onScenOpenBackfun:Function;
		
		/**
		 *场景关闭后回调 
		 */		
		protected var onScenCloseBackfun:Function;
		
		override protected function doDirectViewChangeEvent(dataay:Array):void
		{
			// TODO Auto Generated method stub
			super.doDirectViewChangeEvent(dataay);
			
			if(dataay[1]==Static_Type.VIEW_SCENOPENSTART){
				scenshow_open();
			}
			else if(dataay[1]==Static_Type.VIEW_SCENCLOSE){
				scenshow_close();
			}
			
		}
		
		
		
		
			
		
		
		
		/**
		 *场景打开 需要在这里检查本次场景所需要的初始资源是否都己经完成
		 * 
		 */		
		public function scenshow_open():void{
//			inj_view.visible=true;
			bscenopened=true;
			
			/*viewbase.touchable=true;
			viewbase.touchGroup=false;*/
			settouchEanble(true,false);
			
			sound_playbg();
			
			sendScenOpenEvent();
		}
		
		
		protected var isSceninited:Boolean;
		
		protected function sendScenOpenEvent():void
		{
			// TODO Auto Generated method stub
//			isSceninited=true;
			
			dispEventType(Static_Event.EVENT_SCEN_CHANGE,[Static_Type.VIEW_SCENOPENCOMPLETE,this.scenid,inj_view,this.viewid,onScenCloseBackfun]);
		}
		
		/**
		 *场景关闭 
		 * 
		 */		
		public function scenshow_close():void{
			
			bscenopened=false;
			
			viewbase.touchable=false;
			viewbase.touchGroup=true;
			
			/*if(onScenCloseBackfun!=null){
				onScenCloseBackfun();
			}*/
			
			dispEventType(Static_Event.EVENT_SCEN_CHANGE,[Static_Type.VIEW_SCENCLOSE,this.scenid,this.inj_view,this.viewid,onScenOpenBackfun]);
		
		}
		
		
		
		
		/**
		 *场景静止 
		 * 
		 */		
		public function scenshow_freeze():void{
			
			
		}
		
		
		
	}
}