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

		public static function elementToTFImage(webcamElement:*,width:int=224,height:int=224):* {
			return tidy(function():* {
				// Reads the image as a Tensor from the webcam <video> element.
					var webcamImage:* = fromPixels(webcamElement);
					//debugger;
					var pr:Number;
					pr = webcamElement.width / webcamElement.height;
					var sw:Number;
					sw = width/webcamElement.width  ;
					var sh:Number;
					sh = height/webcamElement.height  ;
					var ss:Number;
					if (sw > sh)
					{
						ss = sw;
					}else
					{
						ss = sh;
					}
					var tw:Number, th:Number;
					tw = Math.round(webcamElement.width * ss);
					th = Math.round(webcamElement.height * ss);
					
					webcamImage = resizeBilinear(webcamImage, [tw,th]);
					
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