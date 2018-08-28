/*[IF-FLASH]*/
package tf
{

	import tf.Tensor;

	/**
	 * movingAverage
	 * @param v ( tf.Tensor | TypedArray |Array) The current moving average value.
	 * @param x ( tf.Tensor | TypedArray |Array) New input value, must have the same shape and dtype as v .
	 * @param decay (number| tf.Scalar ) The decay factor. Typical values are 0.95 and 0.99.
	 * @param step (number| tf.Scalar ) Step count.
	 * @param zeroDebias (boolean) : Whether zeroDebias is to be performed (default: true ).
	 * @return tf.Tensor
	 */
	public function movingAverage(v:*=null,x:*=null,decay:*=null,step:*=null,zeroDebias:*=null):Tensor
	{
		return null;
	}


}