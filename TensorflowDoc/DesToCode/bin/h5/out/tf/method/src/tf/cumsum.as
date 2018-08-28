/*[IF-FLASH]*/
package tf
{

	import tf.Tensor;

	/**
	 * cumsum
	 * @param x ( tf.Tensor | TypedArray |Array) The input tensor to be summed.
	 * @param axis (number) The axis along which to sum. Optional. Defaults to 0.
	 * @param exclusive (boolean) Whether to perform exclusive cumulative sum. Optional.
              Defaults to false. If set to true then the sum of each tensor entry
              does not include its own value, but only the values previous to it
              along the specified axis.
	 * @param reverse (boolean) Whether to sum in the opposite direction. Optional.
              Defaults to false.
	 * @return tf.Tensor
	 */
	public function cumsum(x:*=null,axis:*=null,exclusive:*=null,reverse:*=null):Tensor
	{
		return null;
	}


}