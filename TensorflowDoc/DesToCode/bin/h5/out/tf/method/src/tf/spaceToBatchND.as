/*[IF-FLASH]*/
package tf
{

	import tf.Tensor;

	/**
	 * spaceToBatchND
	 * @param x ( tf.Tensor | TypedArray |Array) A tf.Tensor . N-D with x.shape = [batch] + spatialShape + remainingShape , where spatialShape has M dimensions.
	 * @param blockShape (number[]) A 1-D array. Must be one of the following types: int32 , int64 . Must have shape [M] , all values must be >= 1.
	 * @param paddings (number[][]) A 2-D array.  Must be one of the following types: int32 , int64 . Must have shape [M, 2] , all values must be >= 0. paddings[i] = [padStart, padEnd] specifies the amount to zero-pad from input dimension i + 1 , which corresponds to spatial dimension i .
              It is required that (inputShape[i + 1] + padStart + padEnd) % blockShape[i] === 0 This operation is equivalent to the following steps: Zero-pad the start and end of dimensions [1, ..., M] of the input
              according to paddings to produce padded of shape padded_shape. Reshape padded to reshaped_padded of shape:
              [batch] + [padded_shape[1] / block_shape[0], block_shape[0], ...,
              padded_shape[M] / block_shape[M-1], block_shape[M-1]] + remaining_shape Permute dimensions of reshaped_padded to produce permuted_
              reshaped_padded of shape:
              block_shape + [batch] + [padded_shape[1] / block_shape[0], ...,
              padded_shape[M] / block_shape[M-1]] + remaining_shape Reshape permuted_reshaped_padded to flatten block_shape into the
              batch dimension, producing an output tensor of shape:
              [batch * prod(block_shape)] + [padded_shape[1] / block_shape[0], ...,
              padded_shape[M] / block_shape[M-1]] + remaining_shape
	 * @return tf.Tensor
	 */
	public function spaceToBatchND(x:*=null,blockShape:*=null,paddings:*=null):Tensor
	{
		return null;
	}


}