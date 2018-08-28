/*[IF-FLASH]*/
package tf.train
{

	import tf.AdamaxOptimizer;

	/**
	 * adamax
	 * @param learningRate (number) The learning rate to use for the Adamax gradient
              descent algorithm.
	 * @param beta1 (number) The exponential decay rate for the 1st moment estimates.
	 * @param beta2 (number) The exponential decay rate for the 2nd moment estimates.
	 * @param epsilon (number) A small constant for numerical stability.
	 * @param decay (number) The learning rate decay over each update.
	 * @return AdamaxOptimizer
	 */
	public function adamax(learningRate:*=null,beta1:*=null,beta2:*=null,epsilon:*=null,decay:*=null):AdamaxOptimizer
	{
		return null;
	}


}