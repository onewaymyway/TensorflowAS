package {
	import hooktool.XmlHttpRequestHook;
	import laya.display.Graphics;
	import laya.display.Sprite;
	import laya.net.Loader;
	import laya.net.ResourceVersion;
	import laya.resource.Texture;
	import laya.utils.Browser;
	import laya.utils.Handler;
	import laya.utils.Utils;
	import posnet.PoseNetTools;
	import view.TestView;
	import laya.webgl.WebGL;
	
	public class LayaUISample {
		
		public function LayaUISample() {
			//初始化引擎
			Laya.init(1000, 900);
			Laya.stage.bgColor = null;
			//激活资源版本控制
			ResourceVersion.enable("version.json", Handler.create(this, beginLoad), ResourceVersion.FILENAME_VERSION);
		}
		private var imgPath:String = "res/boxer01.png";
		
		private function beginLoad():void {
			//加载引擎需要的资源
			Laya.loader.load(["res/atlas/comp.atlas", imgPath], Handler.create(this, onLoaded));
		}
		private static var texture:Texture;
		
		private function onLoaded():void {
			
			
			XmlHttpRequestHook.init();
			PoseNetTools.init(new Handler(this,onInited));
			
			
		}
		
		private function testImage():void
		{
			texture = Loader.getRes(imgPath);
			var sp:Sprite;
			sp = new Sprite();
			sp.graphics.drawTexture(texture);
			
			sp.pos(100, 100);
			Laya.stage.addChild(sp);
		}
		private function onInited():void
		{
			trace("urls:", XmlHttpRequestHook.loadList);
			trace("urls:", JSON.stringify(XmlHttpRequestHook.loadList));
			testVideo();
			//PoseNetTools.getImagePosSprite(texture.source, null, new Handler(this, onPosGetd));
		}
		
		private var camaraParam:ARCameraParam;
		private var video:*;
		private var arController:ARController;
		private function testVideo():void
		{
			var completeHandler:Handler;
			
			
			video = LayaArTool.createVideo();
			video.style["z-index"] = -1;
			
			completeHandler = new Handler(this, beginWork, [video]);
			LayaArTool.initPCCamara(video, completeHandler);
		}
		
		private function beginWork(video:*):void {
			this.video = video;
			video.play();
			sp = new Sprite();
			Laya.timer.once(5000, this, beginViedeoDetect);
		}
		private function beginViedeoDetect():void
		{
			video.width = video.videoWidth;
			video.height = video.videoHeight;
			Laya.stage.size(video.width, video.height);
			//Laya.timer.frameLoop(1, this, loopDetect);
			loopDetect();
		}
		private var sp:Sprite;
		private function loopDetect():void
		{
			PoseNetTools.getImagePosSprite(video, sp, new Handler(this, onPosGetd),0.65);
		}
		
		private function onPosGetd(sp:Sprite):void
		{
			//trace("onPosGeted");
			//sp.pos(100, 100);
			Laya.stage.addChild(sp);
			loopDetect();
		}
		
	}
}