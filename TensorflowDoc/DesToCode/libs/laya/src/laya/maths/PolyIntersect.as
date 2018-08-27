package laya.maths {
	import laya.display.Sprite;
	import laya.utils.Utils;
	
	/**
	 * ...
	 * @author ww
	 */
	public class PolyIntersect {
		
		public function PolyIntersect() {
		
		}
		
		public static function dot(x0:Number, y0:Number, x1:Number, y1:Number):Number {
			return x0 * x1 + y0 * y1;
		}
		
		
		public static function isOverlay(proA:Array, proB:Array):Boolean {
			var min:Number, max:Number;
			min = proA[0] < proB[0] ? proA[0] : proB[0];
			max = proA[1] > proB[1] ? proA[1] : proB[1];
			return (proA[1] - proA[0]) + (proB[1] - proB[0]) < max - min;
		}
		
		public static function getPolyProjection(points:Array, vec:Point):Array {
			var min:Number, max:Number;
			var vecLen:Number;
			vecLen = vec.distance(0, 0);
			var tPro:Number;
			var tP:Point;
			tP = points[0];
			tPro = dot(tP.x, tP.y, vec.x, vec.y);
			min = max = tPro;
			var i:int, len:int;
			len = points.length;
			for (i = 1; i < len; i++) {
				tP = points[i];
				tPro = dot(tP.x, tP.y, vec.x, vec.y);
				if (tPro < min)
					min = tPro;
				if (tPro > max)
					max = tPro;
			}
			return [min / vecLen, max / vecLen];
		}
		
		public static function getNormalL(vec:Point, rst:Point = null):Point {
			if (rst)
				return rst.setTo(vec.y, -vec.x);
			return new Point(vec.y, -vec.x);
		}
		private static var _tempAxis:Point;
		
		public static function polygonsCollisionTest(points0:Array, points1:Array):Boolean {
			if (!_tempAxis)
				_tempAxis = new Point();
			if (!isOverlayPoly(points0, points1, points0)) return false;
			if (!isOverlayPoly(points0, points1, points1)) return false;
			return true;
		}
		private static var _tempSides:Point;
		
		private static function isOverlayPoly(points0:Array, points1:Array, referPoints:Array):Boolean {
			if (!_tempSides)
				_tempSides = new Point();
			var i:int, len:int;
			len = referPoints.length;
			var rst:Array = [];
			var pre:Point;
			var tPoint:Point;
			var taxis:Point;
			var proA:Number;
			var proB:Number;
			if (len >= 3) {
				pre = referPoints[0];
				for (i = 1; i < len; i++) {
					tPoint = referPoints[i];
					_tempSides.setTo(pre.x - tPoint.x, pre.y - tPoint.y);
					taxis = getNormalL(_tempSides, _tempAxis);
					proA = getPolyProjection(points0, taxis);
					proB = getPolyProjection(points1, taxis);
					if (isOverlay(proA, proB))
						return false;
					pre = tPoint;
				}
				tPoint = referPoints[0];
				pre = referPoints[len - 1];
				_tempSides.setTo(pre.x - tPoint.x, pre.y - tPoint.y);
				taxis = getNormalL(_tempSides, _tempAxis);
				proA = getPolyProjection(points0, taxis);
				proB = getPolyProjection(points1, taxis);
				if (isOverlay(proA, proB))
					return false;
				
			}
			return true;
		}
		
		public static function getGlobalPoints(sprite:Sprite, points:Array):Array {
			var i:int, len:int;
			len = points.length;
			for (i = 0; i < len; i++) {
				sprite.localToGlobal(points[i], false);
			}
			return points;
		}
		
		public static function getParentPoints(sprite:Sprite, points:Array):Array {
			var i:int, len:int;
			len = points.length;
			for (i = 0; i < len; i++) {
				sprite.toParentPoint(points[i]);
			}
			return points;
		}
		
		public static function getSpriteBoundsPoint(sprite:Sprite):Array {
			var width:Number = sprite.width;
			var height:Number = sprite.height;
			if (width <= 0)
				width = 1;
			if (height <= 0)
				height = 1;
			var x:Number = 0;
			var y:Number = 0;
			return [new Point(x, y), new Point(x + width, y), new Point(x + width, y + height), new Point(x, y + height)];
		}
		
		public static function getSpriteBoundsPointEx(sprite:Sprite):Array {
			var pointList:Array;
			pointList = sprite._getBoundPointsM(true);
			if (!pointList || pointList.length < 8)
				return getSpriteBoundsPoint(sprite);
			pointList = GrahamScan.pListToPointList(GrahamScan.scanPList(pointList), true);
			var rst:Array;
			var i:int, len:int;
			len = pointList.length;
			rst = [];
			rst.length = pointList.length;
			var tPoint:Point;
			for (i = 0; i < len; i++) {
				tPoint = pointList[i];
				rst[i] = new Point(tPoint.x, tPoint.y);
			}
			return rst;
		}
		
		public static function hitTestSprite(spriteA:Sprite, spriteB:Sprite, useRealBounds:Boolean = false):Boolean {
			if (!spriteA.displayedInStage)
				return false;
			if (!spriteB.displayedInStage)
				return false;
			
			var points0:Array;
			var points1:Array;
			if (useRealBounds) {
				points0 = getSpriteBoundsPointEx(spriteA);
				points1 = getSpriteBoundsPointEx(spriteB);
			}
			else {
				points0 = getSpriteBoundsPoint(spriteA);
				points1 = getSpriteBoundsPoint(spriteB);
				
			}
			
			if (spriteA.parent != spriteB.parent) {
				points0 = getGlobalPoints(spriteA, points0);
				points1 = getGlobalPoints(spriteB, points1);
			}
			else {
				points0 = getParentPoints(spriteA, points0);
				points1 = getParentPoints(spriteB, points1);
			}
			return polygonsCollisionTest(points0, points1);
		}
		
		private static function drawPoints(points:Array):void {
			var i:int, len:int;
			len = points.length;
			var tPoint:Point;
			for (i = 0; i < len; i++) {
				tPoint = points[i];
				Laya.stage.graphics.drawCircle(tPoint.x, tPoint.y, 5, "#ff00ff");
				Laya.stage.graphics.fillText("" + tPoint.x + "," + tPoint.y, tPoint.x, tPoint.y + 20, null, "#00ffff");
			}
		}
	}

}