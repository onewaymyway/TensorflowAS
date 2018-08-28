/*[IF-FLASH]*/
package tf
{

	import tf.Tensor;

	/**
	 * batchNormalization
	 * @param x ( tf.Tensor | tf.Tensor1D | TypedArray |Array) The input Tensor.
	 * @param mean ( tf.Tensor | tf.Tensor1D | TypedArray |Array) A mean Tensor.
	 * @param variance ( tf.Tensor | tf.Tensor1D | TypedArray |Array) A variance Tensor.
	 * @param varianceEpsilon (number) A small float number to avoid dividing by 0.
	 * @param scale ( tf.Tensor | tf.Tensor1D | TypedArray |Array) A scale Tensor.
	 * @param offset ( tf.Tensor | tf.Tensor1D | TypedArray |Array) An offset Tensor.
	 * @return tf.Tensor
	 */
	public function batchNormalization(x:*=null,mean:*=null,variance:*=null,varianceEpsilon:*=null,scale:*=null,offset:*=null):Tensor
	{
		return null;
	}


}