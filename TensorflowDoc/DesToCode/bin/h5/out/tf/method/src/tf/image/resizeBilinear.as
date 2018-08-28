/*[IF-FLASH]*/
package tf.image
{

	import tf.Tensor4D;

	/**
	 * resizeBilinear
	 * @param images ( tf.Tensor3D | tf.Tensor4D | TypedArray |Array) The images, of rank 4 or rank 3, of shape [batch, height, width, inChannels] . If rank 3, batch of 1 is assumed.
	 * @param size ([number, number]) The new shape [newHeight, newWidth] to resize the
              images to. Each channel is resized individually.
	 * @param alignCorners (boolean) Defaults to False. If true, rescale
              input by (new_height - 1) / (height - 1) , which exactly aligns the 4
              corners of images and resized images. If false, rescale by new_height / height . Treat similarly the width dimension.
	 * @return tf.Tensor3D | tf.Tensor4D
	 */
	public function resizeBilinear(images:*=null,size:*=null,alignCorners:*=null):Tensor4D
	{
		return null;
	}


}