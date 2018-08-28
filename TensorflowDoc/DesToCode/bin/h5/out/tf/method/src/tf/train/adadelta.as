/*[IF-FLASH]*/
package tf.train
{

	import tf.AdadeltaOptimizer;

	/**
	 * adadelta
	 * @param learningRate (number) The learning rate to use for the Adadelta gradient
              descent algorithm.
	 * @param rho (number) The learning rate decay over each update.
	 * @param epsilon (number) A constant epsilon used to better condition the grad
              update.
	 * @return tf.AdadeltaOptimizer
	 */
	public function adadelta(learningRate:*=null,rho:*=null,epsilon:*=null):AdadeltaOptimizer
	{
		return null;
	}


}