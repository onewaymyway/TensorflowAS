/*[IF-FLASH]*/
package tf
{

	import tf.Tensor3D;

	/**
	 * fromPixels
	 * @param pixels ( ImageData | HTMLImageElement | HTMLCanvasElement | HTMLVideoElement ) The input image to construct the tensor from. The
              supported image types are all 4-channel.
	 * @param numChannels (number) The number of channels of the output tensor. A
              numChannels value less than 4 allows you to ignore channels. Defaults to
              3 (ignores alpha channel of input image).
	 * @return tf.Tensor3D
	 */
	public function fromPixels(pixels:*=null,numChannels:*=null):Tensor3D
	{
		return null;
	}


}