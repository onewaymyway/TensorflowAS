/*[IF-FLASH]*/
package tf
{

	import tf.Tensor4D;

	/**
	 * tensor4d
	 * @param values ( TypedArray |Array) The values of the tensor. Can be nested array of numbers,
              or a flat array, or a TypedArray .
	 * @param shape ([number, number, number, number]) The shape of the tensor. Optional. If not provided,
              it is inferred from values .
	 * @param dtype ('float32'|'int32'|'bool') The data type.
	 * @return tf.Tensor4D
	 */
	public function tensor4d(values:*=null,shape:*=null,dtype:*=null):Tensor4D
	{
		return null;
	}


}