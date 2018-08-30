package demo 
{
	import hooktool.XmlHttpRequestHook;
	import laya.utils.Handler;
	import tftool.MobileNetTool;
	/**
	 * ...
	 * @author ww
	 */
	public class TestMobileNet 
	{
		
		public function TestMobileNet() 
		{
			test();
		}
		
		private function test():void
		{
			//XmlHttpRequestHook.init();
			var path:String;
			path = "http://10.10.20.40/mobilenet_v1_0.25_224/model.json";
			MobileNetTool.loadMobileNet(path, new Handler(this, onModelLoaded));
		}
		
		private function onModelLoaded(modelO:*):void
		{
			trace(modelO);
			//XmlHttpRequestHook.traceResList();
		}
	}

}