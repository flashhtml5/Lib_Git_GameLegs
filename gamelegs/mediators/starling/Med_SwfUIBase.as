package gamelegs.mediators.starling
{
	import flash.utils.getQualifiedClassName;
	import flash.utils.setTimeout;
	
	import R2Event.Robert2CommandEvent;
	
	import gameapi.configs.GameConfig_UIlist;
	import gameapi.statics.Static_Event;
	import gameapi.statics.Static_Type;
	
	import lzm.starling.swf.Swf;
	import lzm.starling.swf.display.SwfImage;
	import lzm.starling.swf.display.SwfMovieClip;
	import lzm.starling.swf.display.SwfSprite;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.text.TextField;
	import starling.textures.TextureSmoothing;
	
	import starlingview.StarlingGameLegsSpriteBase;
	
	import utils.AlignType;
	import utils.DataHelper;
	
	import viewsStarling.base.SwfUIBaseForGameLegs;
	import viewsStarling.extendUI.UIExtendList;
	
	public class Med_SwfUIBase extends Med_GameBase
	{
		
		
		public function Med_SwfUIBase()
		{
			super();
		}
		
	
		
		
		
		
		public var isviewloading:Boolean;
		
		
		[Inject]
		public var inj_view:DisplayObjectContainer;
		
		protected var inviewChild_SwfMovieClip:SwfMovieClip;
		
		
		/**
		 *传入的swf模块,用于资源存取 
		 */		
		public var inSwf:Swf;
		
		/**
		 *传入当前UI的SWF模块 
		 * @param swfname
		 * @param swf
		 * 
		 */		
		protected function initSwf(swfname:String,swf:Swf):void{
		
			inSwf=swf;
		
		}
		
		override protected function initData():void
		{
			// TODO Auto Generated method stub
			super.initData();
			
			swfUIChildTable=new Object();
			
			defaultflatten=false;
		}
		
		
		
		
		
		override public function initialize():void
		{
			// TODO Auto Generated method stub
			super.initialize();
			
			if(this.viewid!=null){
				viewbase.name=this.viewid;
			}
			
			
			if(this.binited==false){
				setTimeout(loadSWFView,1)
			}
			else{
				setTimeout(afterViewInited,1);
			}
			
		}
		
		
		
		
		
		
		
		/**
		 *加载swf及子元件mov到scen 
		 * 
		 */		
		private function loadSWFView():void{
			
			if(viewid==null)return;
			if(isviewloading)return;
			
			isviewloading=true;
			dispEventType(Static_Event.EVENT_LZM_SWF_LOAD,
				[Static_Type.SWFUI_LOAD_TOVIEWID,viewid,inj_view,initSwf]);
		}
		
		
		
		override public function initViewEvent():void
		{
			// TODO Auto Generated method stub
			super.initViewEvent();
			
			addViewListener(TouchEvent.TOUCH,onTouchEvent);
			
			addViewListener(Static_Event.EVENT_VIEW_INITED,onViewInited);
			
			
			
		}
		
		override protected function onAddToStage(e:Event):void
		{
			// TODO Auto Generated method stub
			super.onAddToStage(e);
			
			initViewEvent()
			
		}
		
		override protected function onRemoveStage(e:Event):void
		{
			// TODO Auto Generated method stub
			if(bMovingChild)return;
			
			super.onRemoveStage(e);
			
//			removeViewListeners();
			
			removeViewListerner();
		}
		
		protected function removeViewListerner():void
		{
			// TODO Auto Generated method stub
			
		}		
		
		override protected function afterinit():void
		{
			// TODO Auto Generated method stub
//			super.afterinit();
		}
		
		
		
		
			
		
		
		
		
		
		
		
		
		protected function onViewInited(e:Event):void
		{
			// TODO Auto Generated method stub
			
			this.isviewloading=false;
			
			afterViewInited();
			
		}
		
		
		
		
		
		
		 public function afterViewInited():void
		{
			// TODO Auto Generated method stub
			
			 inviewChild_SwfMovieClip=(inj_view as SwfUIBaseForGameLegs).inview as SwfMovieClip;
			 if(inviewChild_SwfMovieClip.name==null){
				 inviewChild_SwfMovieClip.name=this.viewid+"_inview"
			 }
			 
			syncViewChild(inviewChild_SwfMovieClip as SwfSprite)
			
			
			
			if(defaultflatten){
				(inj_view as SwfUIBaseForGameLegs).flatten();
			}
			
			super.afterinit();
			
		}
		 
		 
		public var defaultflatten:Boolean;
		 
		
		
		
		
		
		
		
		/**
		 *触摸事件 
		 * @param e
		 * 
		 */		
		protected function onTouchEvent(e:TouchEvent):void
		{
			// TODO Auto Generated method stub
			/*var mytouch:Touch=e.getTouch(kaisyx,TouchPhase.ENDED);
			
			if(mytouch){
			
			trace("start")
			
			dispEventType(Static_Event.EVENT_SCEN_CHANGE,
			[Static_Type.VIEW_SCENFADEIN,Static_Type.VIEW_UIMAIN])
			
			}*/
			
		}		
		
		
		
		
		
		
		
		
		/**
		 *如果是有swfmovieid的会接收创建事件 
		 * @param e
		 * 
		 */		
		private function onCreateView(e:Robert2CommandEvent):void
		{
			// TODO Auto Generated method stub
			/*if(this.swfmovieid==null)return;
			
			
			if(e.data[0]==this.swfassetid&&e.data[1]==this.swfmovieid){
			
				creatSWFUI();
			}*/
			
			
			
		}		
		
		
		
		protected var aligntype:int;
		
		
		private var errorChildkeys:Array;
		
		protected function syncViewChild(swfUI:SwfSprite):void
		{
			// TODO Auto Generated method stub
			errorChildkeys=[];
			
			if(swfUI is SwfMovieClip){
				var swfmov:SwfMovieClip=swfUI as SwfMovieClip;
				var movframes:int=swfmov.totalFrames;
				
				for (var i:int = 0; i < movframes; i++) 
				{
					swfmov.gotoAndStop(i);
					_syncViewChildFrame(swfmov);
					
				}
				
				swfmov.gotoAndStop(0,true);
			
			}
			else{
				_syncViewChildFrame(swfUI);
			}
			
			
			
			
			
			
		}		
		
		/**
		 *保存所有的传入资源的子对像 
		 */		
		protected var swfUIChildTable:Object;
		
		
		/**
		 *查找传入的swf对像内的显示对像 
		 * @param name
		 * @return 
		 * 
		 */		
		public function getSwfUIChildByName(name:String):DisplayObject{
		
//			var disp:DisplayObject;
			
			if(swfUIChildTable.hasOwnProperty(name)){
				return swfUIChildTable[name];
			}
			
			return null;
		
		}
		
		
		/**
		 *给某一侦检查 
		 * @param swfUI
		 * 
		 */		
		private function _syncViewChildFrame(swfUI:SwfSprite):void
		{
			// TODO Auto Generated method stub
			var despay:Array=despSwfUI(swfUI);
			
			
			
			for (var i:int = 0; i < despay.length; i++) 
			{
				var despobj:Object=despay[i];
				
				
				
				var child:DisplayObject=swfUI.getChildByName(despobj.name);
				
				if(child is SwfMovieClip){
					
					(child as SwfMovieClip).gotoAndStop(0);
				}
				else if(child is SwfImage){
					
//					(child as SwfImage).smoothing=TextureSmoothing.NONE;
					(child as SwfImage).touchable=false;
				}
				
				if(despobj.name=="")continue;
				
				swfUIChildTable[despobj.name]=child;
				
				
				
				
				
				if(this.hasOwnProperty(despobj.name)){
					
					this[despobj.name]=child;
				}
				else{
					if(errorChildkeys.indexOf(despobj.name)==-1){
						errorChildkeys.push(despobj.name);
						trace("[Warning]=========("+despobj.name+")==========("+getQualifiedClassName(child)+")<==== 父对像(*"+child.parent.name+")Mediator里不包含的 子对像 ,可能是没有写入或者是需要跳过的_类型")
					}
					else{
						continue;
					}
					
					continue;
				}
				
				if(child is TextField){
					child.visible=false;
				}
				if(despobj.name==null)continue;
				if(despobj.name.indexOf("_")==0)continue;
				
				if(despobj.name.indexOf("button_")==0){
					(child as Sprite).touchable=true;
					(child as Sprite).touchGroup=true;
					
					continue;
				}
				if(despobj.name.indexOf("img_")==0)continue;
				if(child is TextField)continue;
				if(child is SwfImage)continue;
				
//				if(despobj.name.indexOf("img_")==0)continue;
//				if(despobj.name.indexOf("comp_")!=0)continue;
  				
				getChildMediator(child);
				
			}
		}
		
		/**
		 *得到子元件的mediator 
		 * @param disp
		 * 
		 */		
		protected function getChildMediator(disp:DisplayObject):void{
		
				if(this.viewid==null){
					throw new Error("类的Viewid 还没有值:"+getQualifiedClassName(this));
				}
				 
				var aliname:String=[disp.name.replace("comp_","")].join(".");
				
				if(errorChildkeys.indexOf(aliname)>=0)return;
				
				var medinst:Object=getViewMediator(disp,aliname);
				
				if(medinst==null){
					errorChildkeys.push(aliname);	
					try
					{
					
						trace("查找对像:("+aliname+") 的mediator失败, class:",disp,"Parentname:",disp.parent.name+"<="+disp.parent.parent["classLink"],"没有生成的Mediator 或 是未设为 _私有! ");
					} 
					catch(error:Error) 
					{
						
						trace("查找对像:("+aliname+") 的mediator失败, class:",disp,"Parentname:",disp.parent["classLink"]);		
					}
				}
		}
		
		
		
		/**
		 *切换显示对像或动画的显示状态 
		 * @param disp
		 * @param visible
		 * @param frameindex
		 * @param stopchild
		 * 
		 */		
		protected function switch_child(disp:DisplayObject, visible:Boolean, frameindex:int, stopchild:Boolean,touchchildenable:Boolean=true):void
		{
			// TODO Auto Generated method stub
			if(disp==null){
				trace("[WARN]"+viewid+"中找到己删除的元件");
				return;
			}
			
			disp.visible=visible;
			
			if(disp is SwfMovieClip){
				if(stopchild){
					(disp as SwfMovieClip).stop(stopchild)
				}
				else{
					(disp as SwfMovieClip).gotoAndStop(frameindex,true);
					
				}
			}
			
			(disp as Sprite).touchGroup=!touchchildenable;
			
		}	
		
		
		/**
		 * 
		 * @param disp
		 * @return 
		 * 
		 */		
		protected function despSwfUI(disp:DisplayObjectContainer):Array{
			
			
			var dispnum:int=disp.numChildren;
			
			var outay:Array=[];
			var dispdict:Object={};
			
			for (var i:int = 0; i < dispnum; i++) 
			{
				var child:DisplayObject=disp.getChildAt(i);
				
				var childobj:Object={};
				
				if(child is SwfMovieClip){
					
					childobj.type="SwfMovieClip";
				}
				else if(child is SwfSprite){
					
					childobj.type="SwfSprite";
				}
				else  if(child is Image){
					
					childobj.type="Image";
				}
				else  if(child is TextField){
					
					childobj.type="TextField";
				}
				else {
					
					childobj.type="NA";
				}
				if(dispdict[child.name]==null){
					if(child.name!=null&&child.name!=""){
						dispdict[child.name]=true;
					}
				}
				else{
					if(child.name!=null&&child.name!=""){
						
						trace("[Error]在同一侦内出现两次的元件("+child.name+"in parent:"+disp.name+"),可能是美术起名重复或元件重叠 会导致Draw升级!")
					}
					
					
				}
				
				childobj.name=child.name;
				
				outay.push(childobj);
			}
			
			
			
			
			return outay;
		}
		
		
		
		
		protected function layoutSwfUI():void{
			 
			if(aligntype==AlignType.leftTop){
//				var getbound:Rectangle=swfUI.getBounds(inj_view);
				inj_view.x=0//(Static_Config.DESIGNWIDTH-swfUI.width)/2+getbound.x;
				inj_view.y=0//(Static_Config.DESIGNHEIGHT-swfUI.height)/2+getbound.y;
			} 
			  
			  
		}
		
		public var bgmusicid:String;
		
		public function sound_playbg():void{
		
			if(bgmusicid){
				dispEventType(Static_Event.EVENT_SOUNDCHANGE,[Static_Type.SOUNDCHANGE_PLAYBG,bgmusicid]);
			}
				
				
		}
		
		public function sound_playeffect(musicid:String):void{
		
			dispEventType(Static_Event.EVENT_SOUNDCHANGE,[Static_Type.SOUNDCHANGE_PLAYEFFECT,musicid]);
			
			
		}
		
		
		
		/**
		 *初始化一个swf_mc ui 并设置this的相应属性  mcinstname
		 * @param swfid
		 * @param mcid
		 * @param mcinstname
		 * @param backfun
		 * 
		 */		
		protected function loadSwfUIBackToInstance(swfid:String,mcid:String,mcinstname:String,backfun:Function):void{
			
			var backthis:*=this;
			var backmcfun:Function=function(backswfdisp:Sprite):void{
				
				backthis[mcinstname]=backswfdisp;
				
				backfun(backswfdisp);
				
			}
			
			
			loadSwfUIBackToMediator(swfid,mcid,backmcfun);
		}
		
		
		/**
		 *加载swf_mc并且初始化mediator 
		 * @param swfpackid
		 * @param mcid
		 * @param backmcfun
		 * 
		 */		
		protected function loadSwfUIBackToMediator(swfpackid:String,mcid:String, backmcfun:Function):void
		{
			// TODO Auto Generated method stub
			
			var backmcmedfun:Function=function(backswfdisp:Sprite):void{
				
				backswfdisp.name=mcid;
				if(inj_view is StarlingGameLegsSpriteBase){
					(inj_view as StarlingGameLegsSpriteBase).addChildByName(backswfdisp,mcid);
				}
				backmcfun(backswfdisp);
				
				
			}
			
			
			dispEventType(Static_Event.EVENT_LZM_SWF_LOAD,
				[Static_Type.SWFUI_LOAD_BACK,swfpackid,mcid,backmcmedfun]);
			
			
			
		}		
		
		
		
		/**
		 *把显示子元件丢入顶层 
		 * @param child
		 * 
		 */		
		protected function addChildToTop(child:DisplayObject):void
		{
			// TODO Auto Generated method stub
			dispEventType(Static_Event.EVENT_DATA_CHANGE,[Static_Type.UIEFFECT_ADDWINDOW,child]);	
		}
		
		/**
		 *可能有加载,先黑屏等待 
		 * 
		 */		
		protected function showTopScreenBlack():void
		{
			// TODO Auto Generated method stub
			dispEventType(Static_Event.EVENT_DATA_CHANGE,[Static_Type.UIEFFECT_SHOWBLACK]);	
		}
		
		
		
		/**
		 *发送UI datachange 事件 
		 * @param eventtype
		 * @param args
		 * 
		 */		
		public function dispUIEvent(eventtype:String,args:Array=null):void{
			
			if(args==null){
				args=[];
			}
			
			args.unshift(eventtype);
			
			dispEventType(Static_Event.EVENT_DATA_CHANGE,args);
		}	
		
		
		
		/*
		override protected function addViewListener(EventType:String, EventCallFunction:Function):void
		{
			// TODO Auto Generated method stub
			super.addViewListener(EventType, EventCallFunction);
		}
		
		override public function afterinitEvent():void
		{
			// TODO Auto Generated method stub
			super.afterinitEvent();
			
			
			
			
		}*/
		
		/**
		 *生成一个列表 
		 * @param packswfid
		 * @param listid
		 * @return 
		 * 
		 */		
		protected function res_getList(packswfid:String,listid:String):UIExtendList{
			
			var list:UIExtendList
			list=new UIExtendList();
			
			list.inj_Swf=inj_Model_GameData.manResource.getSwfByName(packswfid);
			
			var dataconfig:Object=GameConfig_UIlist;
			
			var listconfig:Object=DataHelper.getKeyArrayObject(dataconfig.dataObjects,dataconfig.keylist,dataconfig.fieldlist,listid);
			
			
			list.setData(listconfig);
			
			return list;
		}	
		
		
	}
}