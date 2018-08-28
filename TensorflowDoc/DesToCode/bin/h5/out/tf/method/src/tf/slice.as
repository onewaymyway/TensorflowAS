/*[IF-FLASH]*/
package tf
{

	import tf.Tensor;

	/**
	 * slice
	 * @param x ( tf.Tensor | TypedArray |Array) The input tf.Tensor to slice from.
	 * @param begin (number|number[]) The coordinates to start the slice from. The length can be
              less than the rank of x - the rest of the axes will have implicit 0 as
              start. Can also be a single number, in which case it specifies the
              first axis.
	 * @param size (number|number[]) The size of the slice. The length can be less than the rank of
              x - the rest of the axes will have implicit -1. A value of -1 requests
              the rest of the dimensions in the axis. Can also be a single number,
              in which case it specifies the size of the first axis.
	 * @return tf.Tensor
	 */
	public function slice(x:*=null,begin:*=null,size:*=null):Tensor
	{
		return null;
	}


}