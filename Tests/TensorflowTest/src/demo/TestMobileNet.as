package demo 
{
	import hooktool.XmlHttpRequestHook;
	import laya.display.Sprite;
	import laya.display.Text;
	import laya.net.Loader;
	import laya.resource.Texture;
	import laya.ui.Image;
	import laya.utils.Handler;
	import tftool.ImageClass;
	import tftool.ImageTools;
	import tftool.MobileNetTool;
	/**
	 * ...
	 * @author ww
	 */
	public class TestMobileNet 
	{
		
		private var pic:String;
		public function TestMobileNet() 
		{
			Laya.init(1000, 900);
			
			pic = "res/cat.png";
			pic = "res/rabit.png";
			Laya.loader.load(pic, new Handler(this, test));
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
			
			var tex:Texture;
			tex = Loader.getRes(pic);
			
			
			var image:Image;
			image = new Image();
			image.skin = pic;
			image.pos(100, 100);
			Laya.stage.addChild(image);
			
			
			var ele:*;
			ele = tex.bitmap.source;
			ele.width = 224;
			ele.height = 224;


			MobileNetTool.predict(modelO, ele, 4, new Handler(this, onPredicted));
			
		}
		
		private function onPredicted(rst:*):void
		{
			trace(rst);
			var i:int, len:int;
			len = rst.length;
			
			var text:Text;
			text = new Text();
			text.color = "#ff0000";
			text.pos(100, 100);
			Laya.stage.addChild(text);
			
			var strs:Array;
			strs = [];
			for (i = 0; i < len; i++)
			{
				var tP:Object;
				tP = rst[i];
				strs.push(tP.className+":"+Math.floor(tP.probability*100));
			}
			text.text = strs.join("\n");
		}
	}

}