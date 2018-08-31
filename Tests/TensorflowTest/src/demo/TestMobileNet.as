package demo 
{
	import hooktool.XmlHttpRequestHook;
	import laya.display.Sprite;
	import laya.display.Text;
	import laya.events.Event;
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
		private var pics:Array;
		public function TestMobileNet() 
		{
			Laya.init(1000, 900);
			
			pics = ["res/cat.png","res/rabit.png","res/dog.png","res/pig.png","res/gorilla.png","res/head.png"];
			//pic = "res/cat.png";
			//pic = "res/rabit.png";
			//pic = "res/dog.png";
			Laya.loader.load(pics, new Handler(this, test));
		}
		
		private function test():void
		{
			//XmlHttpRequestHook.init();
			var path:String;
			path = "http://10.10.20.40/mobilenet_v1_0.25_224/model.json";
			MobileNetTool.loadMobileNet(path, new Handler(this, onModelLoaded));
		}
		
		private var image:Image;
		private var _i:int=0;
		private function showOne():void
		{
			_i = _i % pics.length;
			pic = pics[_i];
			_i++;
			image.skin = pic;
			
			var tex:Texture;
			tex = Loader.getRes(pic);
			
			var ele:*;
			ele = tex.bitmap.source;
			//ele.width = 224;
			//ele.height = 224;
			
			MobileNetTool.predict(modelO, ele, 4, new Handler(this, onPredicted));
		}
		
		private var modelO:Object;
		private function onModelLoaded(modelO:*):void
		{
			this.modelO = modelO;
			trace(modelO);
			//XmlHttpRequestHook.traceResList();

			
			image = new Image();
			
			image.pos(100, 100);
			Laya.stage.addChild(image);
			
			showOne();
			
			Laya.stage.on(Event.CLICK, this, showOne);
	
		}
		private var text:Text;
		private function onPredicted(rst:*):void
		{
			//trace(rst);
			var i:int, len:int;
			len = rst.length;
			
			if (!text)
			{
				text = new Text();
				text.color = "#ff0000";
				text.fontSize = 20;
				text.pos(100, 100);
				Laya.stage.addChild(text);
			}
			
			
			var strs:Array;
			strs = [];
			for (i = 0; i < len; i++)
			{
				var tP:Object;
				tP = rst[i];
				strs.push(tP.className+":"+Math.floor(tP.probability*100));
			}
			strs.push("\nclick to switch pics");
			text.text = strs.join("\n");
		}
	}

}