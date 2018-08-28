/*[IF-FLASH]*/
package tf
{

	import tf.Tensor;

	/**
	 * sum
	 * @param x ( tf.Tensor | TypedArray |Array) The input tensor to compute the sum over. If the dtype is bool it will be converted to int32 and the output dtype will be int32 .
	 * @param axis (number|number[]) The dimension(s) to reduce. By default it reduces
              all dimensions.
	 * @param keepDims (boolean) If true, retains reduced dimensions with size 1.
	 * @return tf.Tensor
	 */
	public function sum(x:*=null,axis:*=null,keepDims:*=null):Tensor
	{
		return null;
	}


}