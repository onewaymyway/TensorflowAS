package tftool 
{
	import laya.debug.tools.ColorTool;
	import laya.resource.Texture;
	import laya.utils.Browser;
	import laya.utils.Color;
	/**
	 * ...
	 * @author ww
	 */
	public class ImageObject 
	{
		
		public function ImageObject() 
		{
			
		}
		public var imageData:*;
		public var datas:Array;
		public var width:int;
		public var height:int;
		
		public function init(width:int, height:int):void
		{
			this.width = width;
			this.height = height;
			imageData = new Browser.window.ImageData(width, height);
			datas = imageData.data;
		}
		
		public function getIndex(i:int, j:int):int
		{
			return (i + j * width) * 4;
		}
		public function setColor(i:int, j:int, color:String):void
		{
			var index:int;
			index = getIndex(i, j);
			if (index >= datas.length) return;
			var color:Color;
			color = Color.create(color);
			datas[index] = color._color[0] * 255;
			datas[index+1] = color._color[1] * 255;
			datas[index+2] = color._color[2] * 255;
			datas[index+3] = 255;
		}
		
		public function getColor(i:int, j:int):String
		{
			var index:int;
			index = getIndex(i, j);
			if (index >= datas.length) return;
			return ColorTool.getRGBStr([datas[index],datas[index+1],datas[index+2]]);
		}
		
		
	}

}