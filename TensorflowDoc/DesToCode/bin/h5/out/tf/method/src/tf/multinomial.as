/*[IF-FLASH]*/
package tf
{

	import tf.Tensor2D;

	/**
	 * multinomial
	 * @param logits ( tf.Tensor1D | tf.Tensor2D | TypedArray |Array) 1D array with unnormalized log-probabilities, or
              2D array of shape [batchSize, numOutcomes] . See the normalized parameter.
	 * @param numSamples (number) Number of samples to draw for each row slice.
	 * @param seed (number) The seed number.
	 * @param normalized (boolean) Whether the provided logits are normalized true
              probabilities (sum to 1). Defaults to false.
	 * @return tf.Tensor1D | tf.Tensor2D
	 */
	public function multinomial(logits:*=null,numSamples:*=null,seed:*=null,normalized:*=null):Tensor2D
	{
		return null;
	}


}