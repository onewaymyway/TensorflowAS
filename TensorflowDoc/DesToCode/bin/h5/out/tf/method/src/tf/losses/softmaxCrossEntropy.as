/*[IF-FLASH]*/
package tf.losses
{

	import tf.Tensor;

	/**
	 * softmaxCrossEntropy
	 * @param onehotLabels ( tf.Tensor | TypedArray |Array) One hot encoded labels
              [batch_size, num_classes], same dimensions as 'predictions'.
	 * @param logits ( tf.Tensor | TypedArray |Array) The predicted outputs.
	 * @param weights ( tf.Tensor | TypedArray |Array) Tensor whose rank is either 0, or 1, and must be
              broadcastable to loss of shape [batch_size]
	 * @param labelSmoothing (number) If greater than 0, then smooth the labels.
	 * @param reduction (Reduction) Type of reduction to apply to loss. Should be of type Reduction
	 * @return tf.Tensor
	 */
	public function softmaxCrossEntropy(onehotLabels:*=null,logits:*=null,weights:*=null,labelSmoothing:*=null,reduction:*=null):Tensor
	{
		return null;
	}


}