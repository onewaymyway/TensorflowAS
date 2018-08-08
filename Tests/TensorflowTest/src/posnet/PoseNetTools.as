package posnet {
	import laya.display.Sprite;
	import laya.maths.Point;
	import laya.utils.Browser;
	import laya.utils.Graphics;
	import laya.utils.Handler;
	
	/**
	 * ...
	 * @author ww
	 */
	public class PoseNetTools {
		
		public function PoseNetTools() {
		
		}
		public static var netModel:*;
		
		public static function init(complete:Handler):void {
			var posenet:Object;
			posenet = Browser.window.posenet;
			posenet.load().then(function(net:*):* {
					netModel = net;
					complete.run();
				})
		}
		
		public static function estimatePose(img:*, complete:Handler):void
		{
			var imageScaleFactor:Number = 0.5;
			var flipHorizontal:Boolean = false;
			var outputStride:Number = 16;
			var maxPoseDetections:Number = 2;
			netModel.estimateMultiplePoses(img, 0.5, flipHorizontal, outputStride, maxPoseDetections).then(function(poses:*):void {
				trace("estimateMultiplePoses success");	
				complete.runWith([poses]);
				}
			)
		}
		
		public static function getImagePosSprite(img:*, sp:Sprite, complete:Handler ):void
		{
			function onEstimateSuccess(poses:Array):void
			{
				complete.runWith( drawPosInfo(poses, sp));
			}
			estimatePose(img, Handler.create(null, onEstimateSuccess));
		}
		public static function drawPosInfo(poses:Array, sp:Sprite):Sprite
		{
			if (!sp) sp = new Sprite();
			var g:Graphics;
			g = sp.graphics;
			var i:int, len:int;
			len = poses.length;
			var tPosO:Object;
			for (i = 0; i < len; i++)
			{
				//if (i > 0) continue;
				tPosO = poses[i];
				drawPosToGraphic(tPosO, g);
			}
			return sp;
		}
		private static var posLines:Array = [
		["rightAnkle", "rightKnee"],
		["rightKnee", "rightHip"],
		["rightHip", "leftHip"],
		["leftHip", "leftKnee"],
		["leftKnee", "leftAnkle"],
		["rightWrist", "rightElbow"],
		["rightElbow", "rightShoulder"],
		["rightShoulder", "leftShoulder"],
		["leftShoulder", "leftElbow"],
		["leftElbow", "leftWrist"],
		["rightShoulder", "rightHip"],
		["leftShoulder", "leftHip"],
		["leftEye", "rightEye"],
		["leftEar","rightEar"]
		];
		private static function drawPosToGraphic(posO:Object, g:Graphics):void
		{
			var keyPoints:Array;
			keyPoints = posO.keypoints;
			var i:int, len:int;
			len = keyPoints.length;
			var tPointO:Object;
			var partDic:Object;
			partDic = { };
			for (i = 0; i < len; i++)
			{
				tPointO = keyPoints[i];
				partDic[tPointO.part] = tPointO;
				trace(tPointO.part);
				g.drawCircle(tPointO.position.x, tPointO.position.y, 5, "#ff0000");
				g.fillText(tPointO.part,tPointO.position.x, tPointO.position.y, "Arrial 12px", "#ff0000");
			}
			
			len = posLines.length;
			var tLinePair:Array;
			var pA:Object;
			var pB:Object;
			for (i = 0; i < len; i++)
			{
				tLinePair = posLines[i];
				pA = partDic[tLinePair[0]];
				pB = partDic[tLinePair[1]];
				if (pA && pB)
				{
					g.drawLine(pA.position.x, pA.position.y, pB.position.x, pB.position.y, "#ff0000");
				}
			}
		}
	}

}