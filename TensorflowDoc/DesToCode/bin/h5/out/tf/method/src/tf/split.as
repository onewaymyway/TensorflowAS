/*[IF-FLASH]*/
package tf
{



	/**
	 * split
	 * @param x ( tf.Tensor | TypedArray |Array) The input tensor to split.
	 * @param numOrSizeSplits (number[]|number) Either an integer indicating the number of
              splits along the axis or an array of integers containing the sizes of
              each output tensor along the axis. If a number then it must evenly divide x.shape[axis] ; otherwise the sum of sizes must match x.shape[axis] .
	 * @param axis (number) The dimension along which to split. Defaults to 0 (the first
              dim).
	 * @return tf.Tensor []
	 */
	public function split(x:*=null,numOrSizeSplits:*=null,axis:*=null):*
	{
		return ;
	}


}