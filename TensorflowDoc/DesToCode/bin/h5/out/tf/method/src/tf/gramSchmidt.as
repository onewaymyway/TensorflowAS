/*[IF-FLASH]*/
package tf
{

	import tf.Tensor2D;

	/**
	 * gramSchmidt
	 * @param xs ( tf.Tensor1D []| tf.Tensor2D ) The vectors to be orthogonalized, in one of the two following
              formats: An Array of tf.Tensor1D . A tf.Tensor2D , i.e., a matrix, in which case the vectors are the rows
              of xs .
              In each case, all the vectors must have the same length and the length
              must be greater than or equal to the number of vectors.
	 * @return tf.Tensor1D []| tf.Tensor2D
	 */
	public function gramSchmidt(xs:*=null):Tensor2D
	{
		return null;
	}


}