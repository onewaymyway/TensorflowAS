/*[IF-FLASH]*/
package tf
{

	import tf.Tensor;

	/**
	 * unsortedSegmentSum
	 * @param x ( tf.Tensor | TypedArray |Array) The tf.Tensor that will be summed along its segments
	 * @param segmentIds ( tf.Tensor1D | TypedArray |Array) A tf.Tensor1D whose rank is equal to the rank of x 's
              dimension along the axis .  Maps each element of x to a segment.
	 * @param numSegments (number) The number of distinct segmentIds
	 * @return tf.Tensor
	 */
	public function unsortedSegmentSum(x:*=null,segmentIds:*=null,numSegments:*=null):Tensor
	{
		return null;
	}


}