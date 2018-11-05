package tests 
{
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
			Laya.init(1000, 900);
			test();
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
			Laya.stage.addChild(image);
		}
	}

}