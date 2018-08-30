package demo 
{
	import laya.display.Sprite;
	import laya.utils.Handler;
	import posnet.PoseNetTools;
	/**
	 * ...
	 * @author ww
	 */
	public class PoseNetDemo extends DemoBase 
	{
		
		public function PoseNetDemo() 
		{
			super();
			useVideo = true;
			PoseNetTools.setModuleRoot("");
		}
		
		
		override protected function initModels():void 
		{
			
			PoseNetTools.init(new Handler(this,modelInited));
		}
		
		override protected function allInited():void 
		{
			sp = new Sprite();
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