/*[IF-FLASH]*/
package tf
{

	import tf.Tensor2D;

	/**
	 * eye
	 * @param numRows (number) Number of rows.
	 * @param numColumns (number) Number of columns. Defaults to numRows .
	 * @param batchShape ([
              number
              ]|[number,
              number]|[number, number, number]|[number, number, number, number]) If provided, will add the batch shape to the beginning
              of the shape of the returned tf.Tensor by repeating the identity
              matrix.
	 * @param dtype ('float32'|'int32'|'bool') Data type.
	 * @return tf.Tensor2D
	 */
	public function eye(numRows:*=null,numColumns:*=null,batchShape:*=null,dtype:*=null):Tensor2D
	{
		return null;
	}


}