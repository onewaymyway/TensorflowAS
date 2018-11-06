package tests 
{
	import laya.d3.core.Camera;
	import laya.d3.math.Vector3;
	import laya.d3.math.Viewport;
	import laya.display.Sprite;
	import laya.resource.Texture;
	import laya.utils.HitArea;
	import laya.webgl.resource.WebGLImage;
	import tftool.CameraSprite;
	import tftool.ImageObject;
	import tftool.ImageSprite;
	/**
	 * ...
	 * @author ww
	 */
	public class TestImageSprite 
	{
		
		public function TestImageSprite() 
		{
			//Laya.init(1000, 900);
			Laya3D.init(1000, 900);
			//test();
			//testCamera();
			testCameraSprite();
		}
		
		
		private function test():void
		{
			var image:ImageSprite;
			image = new ImageSprite();
			image.pos(100, 100);
			
			var imageO:ImageObject;
			imageO = new ImageObject();
			image.image = imageO;
			imageO.init(200, 200);
			var i:int, len:int;
			len = 100;
			for (i = 0; i < len; i++)
			{
				imageO.setColor(i, i, "#ff0000");
			}
			//Laya.stage.addChild(image);
			
			var texture:Texture;
			var img:WebGLImage;
			debugger;
			img = new WebGLImage(imageO.imageData,"abc.png");
			texture = new Texture(img);
			var sp:Sprite;
			sp = new Sprite();
			sp.graphics.drawTexture(texture, 0, 0, 200, 200);
			sp.pos(100, 100);
			Laya.stage.addChild(sp);
		}
		
		private function createCirclePoints(r:Number,zeroIndex:int=2,value:Number=0):Array
		{
			var splitCount:int = 32;
			var i:int, len:int;
			len = splitCount;
			var rst:Array;
			rst = [];
			var d:Number;
			d = Math.PI * 2 / len;
			var angle:Number;
			var tArr:Array;
			for (i = 0; i < len; i++)
			{
				angle = d * i;
				tArr = [r * Math.sin(angle), r * Math.cos(angle)];
				tArr.splice(zeroIndex, 0, value);
				rst.push(tArr);
			}
			return rst;
		}
		
		private var cameraSprite:CameraSprite;
		private function testCameraSprite():void
		{
			
			cameraSprite = new CameraSprite();
			
			var points:Array;
			points = createVector3List(createCirclePoints(150));
			points=points.concat(createVector3List(createCirclePoints(150,0)));
			points=points.concat(createVector3List(createCirclePoints(150,1)));
			cameraSprite.positions = points;
			cameraSprite.pos(200, 200);
			Laya.stage.addChild(cameraSprite);
			Laya.timer.loop(100, this, loopCamera);
		}
		
		private function loopCamera():void
		{
			cameraSprite.objTransform.rotate(new Vector3(5, 0, 0), true, false);
		}
		
		private function createVector3List(arr:Array):Array
		{
			var i:int, len:int;
			len = arr.length;
			var rst:Array;
			rst = [];
			var tArr:Array;
			var tPos:Vector3;
			
			for (i = 0; i < len; i++)
			{
				tArr = arr[i];
				tPos = new Vector3();
				tPos.x = tArr[0];
				tPos.y = tArr[1];
				tPos.z = tArr[2];
				rst.push(tPos);
			}
			return rst;
		}
		private function testCamera():void
		{
			var camera:Camera;
			camera = new Camera(1);
			camera.transform.translate(new Vector3(0, 0, 3), false);
			camera.viewport = new Viewport(0, 0, 200, 200);
			
			var positions:Array;
			positions = [];
			var tPos:Vector3;
			tPos = new Vector3();
			tPos.x = 1;
			tPos.y = 1;
			tPos.z = 1;
			positions.push(tPos);
			
			tPos = new Vector3();
			tPos.x = 200;
			tPos.y = 300;
			tPos.z = 100;
			positions.push(tPos);
			
			var out:Vector3;
			out = new Vector3();
			
			var i:int, len:int;
			len = positions.length;
			for (i = 0; i < len; i++)
			{
				tPos = positions[i];
				camera.worldToViewportPoint(tPos, out);
				trace("pos:",out.x,out.y,out.z);
			}
			//camera.worldToViewportPoint(tPos, out);
			//trace(out);
			
			
			//var sp:Sprite;
			//var hit:HitArea;
			
			//sp.hitArea=
			
		}
	}

}