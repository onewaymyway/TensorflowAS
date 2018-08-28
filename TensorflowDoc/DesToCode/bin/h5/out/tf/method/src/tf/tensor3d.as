/*[IF-FLASH]*/
package tf
{

	import tf.Tensor3D;

	/**
	 * tensor3d
	 * @param values ( TypedArray |Array) The values of the tensor. Can be nested array of numbers,
              or a flat array, or a TypedArray .
	 * @param shape ([number, number, number]) The shape of the tensor. If not provided,  it is inferred from values .
	 * @param dtype ('float32'|'int32'|'bool') The data type.
	 * @return tf.Tensor3D
	 */
	public function tensor3d(values:*=null,shape:*=null,dtype:*=null):Tensor3D
	{
		return null;
	}


}