/*[IF-FLASH]*/
package tf
{

	import tf.Tensor2D;

	/**
	 * oneHot
	 * @param indices ( tf.Tensor1D | TypedArray |Array) tf.Tensor1D of indices with dtype int32 .
	 * @param depth (number) The depth of the one hot dimension.
	 * @param onValue (number) A number used to fill in output when the index matches
              the location.
	 * @param offValue (number) A number used to fill in the output when the index does
              not match the location.
	 * @return tf.Tensor2D
	 */
	public function oneHot(indices:*=null,depth:*=null,onValue:*=null,offValue:*=null):Tensor2D
	{
		return null;
	}


}