/*[IF-FLASH]*/
package tf
{

	import tf.Tensor;

	/**
	 * where
	 * @param condition ( tf.Tensor | TypedArray |Array) The input condition. Must be of dtype bool.
	 * @param a ( tf.Tensor | TypedArray |Array) If condition is rank 1, a may have a higher rank but
              its first dimension must match the size of condition .
	 * @param b ( tf.Tensor | TypedArray |Array) A tensor with the same shape and type as a .
	 * @return tf.Tensor
	 */
	public function where(condition:*=null,a:*=null,b:*=null):Tensor
	{
		return null;
	}


}