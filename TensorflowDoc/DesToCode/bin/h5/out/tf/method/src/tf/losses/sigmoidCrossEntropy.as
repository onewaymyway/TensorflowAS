/*[IF-FLASH]*/
package tf.losses
{

	import tf.Tensor;

	/**
	 * sigmoidCrossEntropy
	 * @param multiClassLabels ( tf.Tensor | TypedArray |Array) The ground truth output tensor of shape
              [batch_size, num_classes], same dimensions as 'predictions'.
	 * @param logits ( tf.Tensor | TypedArray |Array) The predicted outputs.
	 * @param weights ( tf.Tensor | TypedArray |Array) Tensor whose rank is either 0, or the same rank as labels , and must be broadcastable to labels (i.e., all dimensions
              must be either 1 , or the same as the corresponding losses dimension).
	 * @param labelSmoothing (number) If greater than 0, then smooth the labels.
	 * @param reduction (Reduction) Type of reduction to apply to loss. Should be of type Reduction
	 * @return tf.Tensor
	 */
	public function sigmoidCrossEntropy(multiClassLabels:*=null,logits:*=null,weights:*=null,labelSmoothing:*=null,reduction:*=null):Tensor
	{
		return null;
	}


}