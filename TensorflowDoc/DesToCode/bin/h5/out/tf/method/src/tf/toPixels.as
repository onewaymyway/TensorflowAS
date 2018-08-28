/*[IF-FLASH]*/
package tf
{

	import Promise;

	/**
	 * toPixels
	 * @param img ( tf.Tensor2D | tf.Tensor3D | TypedArray |Array) A rank-2 or rank-3 tensor. If rank-2, draws grayscale. If
              rank-3, must have depth of 1, 3 or 4. When depth of 1, draws
              grayscale. When depth of 3, we draw with the first three components of
              the depth dimension corresponding to r, g, b and alpha = 1. When depth of
              4, all four components of the depth dimension correspond to r, g, b, a.
	 * @param canvas ( HTMLCanvasElement ) The canvas to draw to.
	 * @return Promise
	 */
	public function toPixels(img:*=null,canvas:*=null):Promise
	{
		return null;
	}


}