/*[IF-FLASH]*/
package tf.train
{

	import tf.RMSPropOptimizer;

	/**
	 * rmsprop
	 * @param learningRate (number) The learning rate to use for the RMSProp gradient
              descent algorithm.
	 * @param decay (number) The discounting factor for the history/coming gradient.
	 * @param momentum (number) The momentum to use for the RMSProp gradient descent
              algorithm.
	 * @param epsilon (number) Small value to avoid zero denominator.
	 * @param centered (boolean) If true, gradients are normalized by the estimated
              variance of the gradient.
	 * @return tf.RMSPropOptimizer
	 */
	public function rmsprop(learningRate:*=null,decay:*=null,momentum:*=null,epsilon:*=null,centered:*=null):RMSPropOptimizer
	{
		return null;
	}


}