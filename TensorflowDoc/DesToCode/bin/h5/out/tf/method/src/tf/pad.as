/*[IF-FLASH]*/
package tf
{

	import tf.Tensor;

	/**
	 * pad
	 * @param x ( tf.Tensor | TypedArray |Array) The tensor to pad.
	 * @param paddings (Array) An array of length R (the rank of the tensor), where
              each element is a length-2 tuple of ints [padBefore, padAfter] ,
              specifying how much to pad along each dimension of the tensor.
	 * @param constantValue (number) The pad value to use. Defaults to 0.
	 * @return tf.Tensor
	 */
	public function pad(x:*=null,paddings:*=null,constantValue:*=null):Tensor
	{
		return null;
	}


}