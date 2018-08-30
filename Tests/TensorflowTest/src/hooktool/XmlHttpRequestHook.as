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
		private static var preFetch:Function;
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
		
		public static function adptFetch(url:String,paramO:Object):void
		{
			trace("url:", url);
			if (isRecording)
			{
				loadList.push(url);
			}
			return preFetch.call(this,url, paramO);
		}
		public static function init():void
		{
			preFetch = Browser.window.fetch;
			Browser.window.fetch = adptFetch;
			preOpen = Browser.window.XMLHttpRequest["prototype"]["open"];
			Browser.window.XMLHttpRequest["prototype"]["open"] = XmlHttpRequestHook["prototype"]["open"];
		}
		
		public static function traceResList():void
		{
			trace(loadList);
			trace(JSON.stringify(loadList));
		}
		
		
	}

}