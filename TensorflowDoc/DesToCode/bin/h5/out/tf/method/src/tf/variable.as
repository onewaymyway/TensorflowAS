/*[IF-FLASH]*/
package tf
{

	import tf.Variable;

	/**
	 * variable
	 * @param initialValue ( tf.Tensor ) Initial value for the tensor.
	 * @param trainable (boolean) If true, optimizers are allowed to update it.
	 * @param name (string) Name of the variable. Defaults to a unique id.
	 * @param dtype ('float32'|'int32'|'bool') If set, initialValue will be converted to the given type.
	 * @return tf.Variable
	 */
	public function variable(initialValue:*=null,trainable:*=null,name:*=null,dtype:*=null):Variable
	{
		return null;
	}


}