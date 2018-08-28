/*[IF-FLASH]*/
package tf
{

	import tf.Tensor;

	/**
	 * norm
	 * @param x ( tf.Tensor | TypedArray |Array) The input array.
	 * @param ord (number|'euclidean'|'fro') Optional. Order of the norm. Supported norm types are
              following: ord norm for matrices norm for vectors 'euclidean' Frobenius norm 2-norm 'fro' Frobenius norm Infinity max(sum(abs(x), axis=1)) max(abs(x)) -Infinity min(sum(abs(x), axis=1)) min(abs(x)) 1 max(sum(abs(x), axis=0)) sum(abs(x)) 2 sum(abs(x)^2)^1/2*
	 * @param axis (number|number[]) Optional. If axis is null (the default), the input is
              considered a vector and a single vector norm is computed over the entire
              set of values in the Tensor, i.e. norm(x, ord) is equivalent
              to norm(x.reshape([-1]), ord). If axis is a integer, the input
              is considered a batch of vectors, and axis determines the axis in x
              over which to compute vector norms. If axis is a 2-tuple of integer it is
              considered a batch of matrices and axis determines the axes in NDArray
              over which to compute a matrix norm.
	 * @param keepDims (boolean) Optional. If true, the norm have the same dimensionality
              as the input.
	 * @return tf.Tensor
	 */
	public function norm(x:*=null,ord:*=null,axis:*=null,keepDims:*=null):Tensor
	{
		return null;
	}


}