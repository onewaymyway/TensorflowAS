/*[IF-FLASH]*/
package tf
{

	import tf.Tensor;

	/**
	 * batchToSpaceND
	 * @param x ( tf.Tensor | TypedArray |Array) A tf.Tensor . N-D with x.shape = [batch] + spatialShape + remainingShape , where spatialShape has M dimensions.
	 * @param blockShape (number[]) A 1-D array. Must be one of the following types: int32 , int64 . Must have shape [M] , all values must be >= 1.
	 * @param crops (number[][]) A 2-D array.  Must be one of the following types: int32 , int64 . Must have shape [M, 2] , all values must be >= 0. crops[i] = [cropStart, cropEnd] specifies the amount to crop from input dimension `i 1 , which corresponds to spatial dimension i . It is required that cropStart[i] + cropEnd[i] <= blockShape[i] * inputShape[i + 1]` This operation is equivalent to the following steps: Reshape x to reshaped of shape: [blockShape[0], ..., blockShape[M-1], batch / prod(blockShape), x.shape[1], ..., x.shape[N-1]] Permute dimensions of reshaped to produce permuted of shape [batch / prod(blockShape),x.shape[1], blockShape[0], ..., x.shape[M], blockShape[M-1],x.shape[M+1], ..., x.shape[N-1]] Reshape permuted to produce reshapedPermuted of shape [batch / prod(blockShape),x.shape[1] * blockShape[0], ..., x.shape[M] * blockShape[M-1],x.shape[M+1], ..., x.shape[N-1]] Crop the start and end of dimensions [1, ..., M] of reshapedPermuted according to crops to produce the output of shape: [batch / prod(blockShape),x.shape[1] * blockShape[0] - crops[0,0] - crops[0,1], ..., x.shape[M] * blockShape[M-1] - crops[M-1,0] - crops[M-1,1],x.shape[M+1], ..., x.shape[N-1]]
	 * @return tf.Tensor
	 */
	public function batchToSpaceND(x:*=null,blockShape:*=null,crops:*=null):Tensor
	{
		return null;
	}


}