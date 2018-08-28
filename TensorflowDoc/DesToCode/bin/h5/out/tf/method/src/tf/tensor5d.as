/*[IF-FLASH]*/
package tf
{

	import tf.Tensor5D;

	/**
	 * tensor5d
	 * @param values ( TypedArray |Array) The values of the tensor. Can be nested array of numbers,
              or a flat array, or a TypedArray .
	 * @param shape ([number, number, number, number, number]) The shape of the tensor. Optional. If not provided,
              it is inferred from values .
	 * @param dtype ('float32'|'int32'|'bool') The data type.
	 * @return tf.Tensor5D
	 */
	public function tensor5d(values:*=null,shape:*=null,dtype:*=null):Tensor5D
	{
		return null;
	}


}