package tftool {
	import tf.fromPixels;
	import tf.image.resizeBilinear;
	import tf.scalar;
	import tf.tidy;
	
	/**
	 * ...
	 * @author ww
	 */
	public class ImageTools {
		
		public function ImageTools() {
		
		}

		public static function getAdptSize(size:Array,width:int=224,height:int=224):Array
		{
					var sw:Number;
					sw = width/size[0]  ;
					var sh:Number;
					sh = height/size[1]  ;
					var ss:Number;
					if (sw > sh)
					{
						ss = sw;
					}else
					{
						ss = sh;
					}
					var tw:Number, th:Number;
					tw = Math.round(size[0] * ss);
					th = Math.round(size[1] * ss);
					return [tw,th];
		}
		
		public static function adptElementToSize(ele:*, width:int = 244, height: int = 224):void
		{
			var size:Array;
			size = getAdptSize([ele.width, ele.height], width, height);
			ele.width = size[0];
			ele.height = size[1];
		}
		
		public static function elementToTFImage(webcamElement:*,width:int=224,height:int=224):* {
			return tidy(function():* {
				// Reads the image as a Tensor from the webcam <video> element.
					var webcamImage:* = fromPixels(webcamElement);

					
					webcamImage = resizeBilinear(webcamImage, getAdptSize([webcamElement.width,webcamElement.height],width,height));
					
					// Crop the image so we're using the center square of the rectangular
					// webcam.
					var croppedImage:* = cropImage(webcamImage,width,height);
					
					// Expand the outer most dimension so we have a batch size of 1.
					var batchedImage:* = croppedImage.expandDims(0);
					
					// Normalize the image between -1 and 1. The image comes in between 0-255,
					// so we divide by 127 and subtract 1.
					return batchedImage.toFloat().div(scalar(127)).sub(scalar(1));
				});
		}
		
		public static function cropImage(img,width,height):* {
			var size:int = Math.min(img.shape[0], img.shape[1]);
			var centerHeight:int = img.shape[0] / 2;
			var beginHeight:int = centerHeight - (height / 2);
			var centerWidth:int = img.shape[1] / 2;
			var beginWidth:int = centerWidth - (width / 2);
			return img.slice([beginHeight, beginWidth, 0], [width, height, 3]);
		}
		
	}

}