package demo 
{
	import faceai.FaceAPI;
	import laya.display.Sprite;
	import laya.utils.Handler;
	/**
	 * ...
	 * @author ww
	 */
	public class FaceAPIDemo extends PoseNetDemo 
	{
		
		public function FaceAPIDemo() 
		{
			super();
			useVideo = true;
		}
		
		override protected function initModels():void 
		{
			var modelPath:String;
			modelPath = "weights/";
			modelPath = "http://10.10.20.40/weights/";
			FaceAPI.init(new Handler(this,modelInited),modelPath);
			
		}
		
		override protected function allInited():void 
		{
			sp = new Sprite();
			loopDetect();
		}
		
		private var sp:Sprite;
		private function loopDetect():void
		{
			FaceAPI.getImageFaceSprite(video, sp,new Handler(this, onGetImageFaceSprite));
		}
		
		private function onGetImageFaceSprite(sp:Sprite):void
		{
			Laya.stage.addChild(sp);
			sp.pos(0, 0);
			
			//loopDetect();
			Laya.timer.once(500, this, loopDetect);
		}
	}

}