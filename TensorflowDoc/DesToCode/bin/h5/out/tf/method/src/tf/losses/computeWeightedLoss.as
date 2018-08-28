/*[IF-FLASH]*/
package tf.losses
{

	import tf.Tensor;

	/**
	 * computeWeightedLoss
	 * @param losses ( tf.Tensor | TypedArray |Array) Tensor of shape [batch_size, d1, ... dN] .
	 * @param weights ( tf.Tensor | TypedArray |Array) Tensor whose rank is either 0, or the same rank as losses , and must be broadcastable to losses (i.e., all
              dimensions must be either 1 , or the same as the corresponding losses dimension).
	 * @param reduction (Reduction) 
	 * @return tf.Tensor
	 */
	public function computeWeightedLoss(losses:*=null,weights:*=null,reduction:*=null):Tensor
	{
		return null;
	}


}