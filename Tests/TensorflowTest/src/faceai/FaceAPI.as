package faceai {
	import laya.display.Graphics;
	import laya.display.Sprite;
	import laya.utils.Browser;
	import laya.utils.Handler;
	
	/**
	 * ...
	 * @author ww
	 */
	public class FaceAPI {
		
		public function FaceAPI() {
		
		}
		public static var faceapi:*;
		
		public static function init(complete:Handler,modelPath:String="weights/"):void {
			faceapi = Browser.window.faceapi;
			//debugger;
			faceapi.loadFaceDetectionModel(modelPath).then(function():* {
					return faceapi.loadFaceLandmarkModel(modelPath);
				}).then(function():void {
					if (complete)
						complete.run();
				});
			//faceapi.loadFaceLandmarkModel("weights/").then(function():void {
			//if (complete)
			//complete.run();
			//});
		}
		
		public static function detectLandmarks(img:*, complete:Handler):void {
			faceapi.detectLandmarks(img).then(function(marks:*):void {
					trace(marks);
					if (complete) {
						complete.runWith(marks);
					}
				})
		}
		
		public static function getImageFaceSprite(img:*, sp:Sprite,complete:Handler):void
		{
			Browser.window.getImgSp(img, sp).then(
			function(spO:*):*
			{
				if (complete)
				{
					complete.runWith(spO);
				}
			}
			)
		}
		public static function locateFaces(img:*, complete:Handler, minConfidence:Number = 0.5):void
		{
			faceapi.locateFaces(input, minConfidence).then(
			function(locations:*):void
			{
				if (complete)
				{
					complete.runWith([locations]);
				}
			}
			)
		}
		public static function getLandMarksSp(landMarkList:Array, sp:Sprite):Sprite
		{
			if (!sp)
				sp = new Sprite();
			sp.graphics.clear();
			var i:int, len:int;
			len = landMarkList.length;
			for (i = 0; i < len; i++)
			{
				getLandMarkSp(landMarkList[i], sp, false);
			}
			return sp;
				
		}
		public static function getLandMarkSp(landmarks:Object, sp:Sprite,autoClear:Boolean=true):Sprite {
			if (!sp)
				sp = new Sprite();
			var g:Graphics;
			g = sp.graphics;
			if(autoClear)
			g.clear();
			
			var funs:Array;
			funs = ["JawOutline", "LeftEyeBrow", "RightEyeBrow", "Nose", "LeftEye", "RightEye", "Mouth"];
			var i:int, len:int;
			len = funs.length;
			var funName:String;
			var points:Array;
			for (i = 0; i < len; i++) {
				funName = "get" + funs[i];
				points = landmarks[funName]();
				drawPointsToG(points, g);
			}
			return sp;
		}
		
		private static function drawPointsToG(points:Array, g:Graphics):void {
			var i:int, len:int;
			len = points.length;
			var tPointO:Object;
			for (i = 0; i < len; i++) {
				tPointO = points[i];
				g.drawCircle(tPointO.x, tPointO.y, 3, "#ff0000");
			}
		}
	}

}