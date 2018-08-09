package hooktool 
{
	import laya.utils.Browser;
	/**
	 * ...
	 * @author ww
	 */
	public class XmlHttpRequestHook 
	{
		
		public function XmlHttpRequestHook() 
		{
			
		}
		private static var preOpen:Function;
		public static var isRecording:Boolean = true;
		public static var loadList:Array=[];
		public function open(type:String, url:String):void
		{
			trace("url:", url);
			if (isRecording)
			{
				loadList.push(url);
			}
			preOpen.call(this, type, url);
		}
		public static function init():void
		{
			preOpen = Browser.window.XMLHttpRequest["prototype"]["open"];
			Browser.window.XMLHttpRequest["prototype"]["open"] = XmlHttpRequestHook["prototype"]["open"];
		}
		
		
	}

}