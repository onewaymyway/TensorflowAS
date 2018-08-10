package faceai {
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
		
		public static function init(complete:Handler):void {
			faceapi = Browser.window.faceapi;
			//debugger;
			faceapi.loadFaceLandmarkModel("weights/").then(function():void {
					if (complete)
						complete.run();
				});
		}
		
		public static function detectLandmarks(img:*, complete:Handler):void {
			faceapi.detectLandmarks(img).then(function(marks:*):void {
					trace(marks);
					if (complete) {
						complete.runWith(marks);
					}
				})
		}
	}

}