package {
	import laya.display.Graphics;
	import laya.display.Sprite;
	import laya.net.Loader;
	import laya.net.ResourceVersion;
	import laya.resource.Texture;
	import laya.utils.Browser;
	import laya.utils.Handler;
	import posnet.PoseNetTools;
	import view.TestView;
	import laya.webgl.WebGL;
	
	public class LayaUISample {
		
		public function LayaUISample() {
			//初始化引擎
			Laya.init(1000, 900);
			
			//激活资源版本控制
			ResourceVersion.enable("version.json", Handler.create(this, beginLoad), ResourceVersion.FILENAME_VERSION);
		}
		private var imgPath:String = "res/boxer.png";
		
		private function beginLoad():void {
			//加载引擎需要的资源
			Laya.loader.load(["res/atlas/comp.atlas", imgPath], Handler.create(this, onLoaded));
		}
		private static var texture:Texture;
		
		private function onLoaded():void {
			
			
			
			PoseNetTools.init(new Handler(this,onInited));
			
			
		}
		
		private function onInited():void
		{
			texture = Loader.getRes(imgPath);
			var sp:Sprite;
			sp = new Sprite();
			sp.graphics.drawTexture(texture);
			
			sp.pos(100, 100);
			Laya.stage.addChild(sp);
			
			PoseNetTools.getImagePosSprite(texture.source, null, new Handler(this, onPosGetd));
		}
		
		private function onPosGetd(sp:Sprite):void
		{
			sp.pos(100, 100);
			Laya.stage.addChild(sp);
		}
		
	}
}