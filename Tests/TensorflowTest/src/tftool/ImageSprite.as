package tftool 
{
	import laya.display.Sprite;
	import laya.renders.RenderContext;
	
	/**
	 * ...
	 * @author ww
	 */
	public class ImageSprite extends Sprite 
	{
		public var image:ImageObject;
		public function ImageSprite() 
		{
			customRenderEnable = true;
		}
		
		override public function customRender(context:RenderContext, x:Number, y:Number):void 
		{
			
			var ctx:*;
			ctx = context.ctx;
			if(image)
			ctx.putImageData(image.imageData, x, y);
		}
	}

}