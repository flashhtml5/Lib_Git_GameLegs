﻿/***
Line 版本:v1.0
简要说明:这家伙很懒什么都没写
创建人:ZЁЯ¤  身高:168cm+;体重:57kg+;未婚(已有女友);最爱的运动:睡觉;格言:路见不平,拔腿就跑;QQ:358315553
创建时间:2009年7月30日 15:16:40
历次修改:未有修改
用法举例:这家伙很懒什么都没写
*/

package utils.trigs{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	public class Line extends Sprite{
		public function Line(){
			this.addEventListener(Event.ADDED_TO_STAGE,added);
		}
		private function added(event:Event):void{
			this.removeEventListener(Event.ADDED_TO_STAGE,added);
			this.addEventListener(Event.REMOVED_FROM_STAGE,removed);
			this.addEventListener(Event.ENTER_FRAME,enterFrame);
			intersects=false;
			var i:int=this.numChildren;
			while(--i>=0){
				var child=this.getChildAt(i);
				child.x+=this.x;
				child.y+=this.y;
			}
			this.x=0;
			this.y=0;
		}
		private function removed(event:Event):void{
			this.removeEventListener(Event.REMOVED_FROM_STAGE,removed);
			this.removeEventListener(Event.ENTER_FRAME,enterFrame);
		}
		private function enterFrame(event:Event):void{
			line.x=dot1.x;
			line.y=dot1.y;
			var dx:Number=dot2.x-dot1.x;
			var dy:Number=dot2.y-dot1.y;
			line.scaleX=Math.sqrt(dx*dx+dy*dy)/100;
			line.rotation=Math.atan2(dy,dx)*(180/Math.PI);
		}
		
		private var __intersects:Boolean;
		public function get intersects():Boolean{
			return __intersects;
		}
		public function set intersects(_intersects:Boolean):void{
			__intersects=_intersects;
			line.gotoAndStop(__intersects?2:1);
		}
	}
}

//

// 常忘正则表达式
// /^\s*|\s*$/					//前后空白						"\nabc d  e 哈 哈\t \r".replace(/^\s*|\s*$/g,"") === "abc d  e 哈 哈"
// /[\\\/:*?\"<>|]/				//不合法的windows文件名字符集		"\\\/:*?\"<>|\\\/:*哈 哈?\"<>|\\哈 \/:*?\"<>|".replace(/[\\\/:*?\"<>|]/g,"") === "哈 哈哈 "
// /[a-zA-Z_][a-zA-Z0-9_]*/		//合法的变量名(不考虑中文)
// value=value.replace(/[^a-zA-Z0-9_]/g,"").replace(/^[0-9]*/,"");//替换不合法的变量名
// 先把除字母数字下划线的字符去掉,再把开头的数字去掉
// 想不到怎样能用一个正则表达式搞定...

//正则表达式30分钟入门教程		http://www.unibetter.com/deerchao/zhengzhe-biaodashi-jiaocheng-se.htm
//正则表达式用法及实例			http://eskimo.blogbus.com/logs/29095458.html
//常用正则表达式					http://www.williamlong.info/archives/433.html

/*

//常用值

//常用语句块

*/