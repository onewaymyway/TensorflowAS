package tftool 
{
	import laya.d3.core.Camera;
	import laya.d3.core.Transform3D;
	import laya.d3.math.Vector3;
	import laya.d3.math.Viewport;
	import laya.display.Graphics;
	import laya.display.Sprite;
	import laya.maths.Point;
	import laya.renders.RenderContext;
	/**
	 * ...
	 * @author ww
	 */
	public class CameraSprite extends Sprite
	{
		public var positions:Array;
		public var camera:Camera;
		private var _3dSprite:Sprite;
		private var _2dSprite:Sprite;
		private var objTransform:Transform3D;
		public function CameraSprite() 
		{
			
			camera = new Camera(1);
			camera.transform.translate(new Vector3(0, 0, -1000), false);
			//camera.transform.rotate(new Vector3(45, 45, 0), false, false);
			camera.transform.lookAt(new Vector3(0, 0, 0), new Vector3(0, -1, 0));
			camera.transform = camera.transform;
			camera.transform._onWorldTransform();
			camera.viewport = new Viewport(0, 0, 500, 500);
			customRenderEnable = true;
			
			objTransform = new Transform3D();
			objTransform.translate(new Vector3(0, 0, 0));
			objTransform.rotate(new Vector3(0, 85, 75), true, false);
			_3dSprite = new Sprite();
			addChild(_3dSprite);
			_2dSprite = new Sprite();
			_2dSprite.pos(300, 0);
			addChild(_2dSprite);
		}
		
		
		override public function customRender(context:RenderContext, x:Number, y:Number):void 
		{
			if (!positions) return;
			camera.viewMatrix;
			drawPoints(positions, _3dSprite, "#ff0000");
			drawPoints(get2dPoints(positions), _2dSprite, "#00ff00");
		}
		

		private static var _out:Vector3;
		private static var _temp:Vector3;
		private function get2dPoints(points:Array):Array
		{
			if (!_out)
			{
				_out = new Vector3(); 
				_temp = new Vector3();
			} 
			var i:int, len:int;
			var tPos:Vector3;
			len = points.length;
			var rst:Array;
			rst = [];
			for (i = 0; i < len; i++)
			{
				tPos = points[i];
				Vector3.transformV3ToV3(tPos, objTransform.localMatrix, _temp);
				camera.worldToViewportPoint(_temp, _out);
				rst.push(_out.clone());
			}
			return rst;
		}
		
		private static function drawPoints(points:Array, sp:Sprite,color:String="#ff0000"):void
		{
			var g:Graphics;
			g = sp.graphics;
			g.clear();
			var i:int, len:int;
			len = points.length;
			var tPos:Point;
			for (i = 0; i < len; i++)
			{
				tPos = points[i];
				g.drawCircle(tPos.x, tPos.y, 2, color);
				g.fillText(i + "", tPos.x, tPos.y, null, color, "center");
			}
		}
	}

}