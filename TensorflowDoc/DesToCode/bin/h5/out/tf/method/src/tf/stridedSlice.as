/*[IF-FLASH]*/
package tf
{

	import tf.Tensor;

	/**
	 * stridedSlice
	 * @param x ( tf.Tensor | TypedArray |Array) The tensor to stride slice.
	 * @param begin (number[]) The coordinates to start the slice from.
	 * @param end (number[]) : The coordinates to end the slice at.
	 * @param strides (number[]) : The size of the slice.
	 * @param beginMask (number) : If the ith bit of begin_mask is set, begin[i] is ignored
              and the fullest possible range in that dimension is used instead.
	 * @param endMask (number) : If the ith bit of end_mask is set, end[i] is ignored
              and the fullest possible range in that dimension is used instead.
	 * @param ellipsisMask (number) 
	 * @param newAxisMask (number) 
	 * @param shrinkAxisMask (number) : a bitmask where bit i implies that
              the ith specification should shrink the dimensionality. begin and end must
              imply a slice of size 1 in the dimension.
	 * @return tf.Tensor
	 */
	public function stridedSlice(x:*=null,begin:*=null,end:*=null,strides:*=null,beginMask:*=null,endMask:*=null,ellipsisMask:*=null,newAxisMask:*=null,shrinkAxisMask:*=null):Tensor
	{
		return null;
	}


}