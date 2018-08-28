/*[IF-FLASH]*/
package tf
{

	import tf.Tensor;

	/**
	 * customGrad
	 * @param f ((a: tf.Tensor , b: tf.Tensor ,...) => {
              value: tf.Tensor , * gradFunc: (dy: tf.Tensor ) => tf.Tensor | tf.Tensor [] * }) The function to evaluate in forward mode, which should return {value: Tensor, gradFunc: (dy) => Tensor[]} , where gradFunc returns
              the custom gradients of f with respect to its inputs.
	 * @return (...args: tf.Tensor []) => tf.Tensor
	 */
	public function customGrad(f:*=null):Tensor
	{
		return null;
	}


}