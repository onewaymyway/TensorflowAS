/*[IF-FLASH]*/
package tf
{

	import tf.Tensor4D;

	/**
	 * localResponseNormalization
	 * @param x ( tf.Tensor3D | tf.Tensor4D | TypedArray |Array) The input tensor. The 4-D input tensor is treated as a 3-D array
              of 1D vectors (along the last dimension), and each vector is
              normalized independently.
	 * @param depthRadius (number) The number of adjacent channels in the 1D normalization
              window.
	 * @param bias (number) A constant bias term for the basis.
	 * @param alpha (number) A scale factor, usually positive.
	 * @param beta (number) An exponent.
	 * @return tf.Tensor3D | tf.Tensor4D
	 */
	public function localResponseNormalization(x:*=null,depthRadius:*=null,bias:*=null,alpha:*=null,beta:*=null):Tensor4D
	{
		return null;
	}


}