package demo {
	import laya.display.Sprite;
	import laya.net.Loader;
	import laya.net.ResourceVersion;
	import laya.resource.Texture;
	import laya.utils.Handler;
	
	/**
	 * ...
	 * @author ww
	 */
	public class DemoBase {
		
		public function DemoBase() {
			//初始化引擎
			Laya.init(1000, 900);
			Laya.stage.bgColor = null;
			//激活资源版本控制
			ResourceVersion.enable("version.json", Handler.create(this, beginLoad), ResourceVersion.FILENAME_VERSION);
		}
		protected static var texture:Texture;
		
		public function initConfig():void {
		
		}
		//private var imgPath:String = "res/head.png";
		protected var imgPath:String = "res/bbt1.jpg";
		protected var video:*;
		public var useVideo:Boolean = false;
		
		protected function beginLoad():void {
			initConfig();
			//imgPath = "res/boxer.png";
			//加载引擎需要的资源
			Laya.loader.load(["res/atlas/comp.atlas", imgPath], Handler.create(this, onLoaded));
		}
		
		protected function testImage():void {
			texture = Loader.getRes(imgPath);
			var sp:Sprite;
			sp = new Sprite();
			sp.graphics.drawTexture(texture);
			
			sp.pos(100, 100);
			Laya.stage.addChild(sp);
		}
		
		protected function onLoaded():void {
			
			if (useVideo) {
				video = LayaArTool.createVideo();
				video.style["z-index"] = -1;
				var completeHandler:Handler;
				completeHandler = new Handler(this, initComplete);
				LayaArTool.initPCCamara(video, completeHandler);
			}
			else {
				initComplete();
			}
		}
		
		protected function initComplete():void {
			if (useVideo)
			{
				video.play();
				Laya.timer.once(1000, this, videoSizeOK);
			}else
			initModels();
		}
		
		protected function videoSizeOK():void
		{
			video.width = video.videoWidth;
			video.height = video.videoHeight;
			Laya.stage.size(video.width, video.height);
			initModels();
		}
		
		protected function initModels():void
		{
			modelInited();
		}
		
		protected function modelInited():void
		{
			allInited();
		}
		protected function allInited():void
		{
			
		}
	}

}