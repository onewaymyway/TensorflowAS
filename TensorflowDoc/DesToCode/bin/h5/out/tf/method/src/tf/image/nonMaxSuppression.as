/*[IF-FLASH]*/
package tf.image
{

	import tf.Tensor1D;

	/**
	 * nonMaxSuppression
	 * @param boxes ( tf.Tensor2D | TypedArray |Array) a 2d tensor of shape [numBoxes, 4] . Each entry is [y1, x1, y2, x2] , where (y1, x1) and (y2, x2) are the corners of
              the bounding box.
	 * @param scores ( tf.Tensor1D | TypedArray |Array) a 1d tensor providing the box scores of shape [numBoxes] .
	 * @param maxOutputSize (number) The maximum number of boxes to be selected.
	 * @param iouThreshold (number) A float representing the threshold for deciding whether
              boxes overlap too much with respect to IOU. Must be betwen [0, 1].
              Defaults to 0.5 (50% box overlap).
	 * @param scoreThreshold ( tf.any() ) A threshold for deciding when to remove boxes based
              on score. Defaults to -inf, which means any score is accepted.
	 * @return tf.Tensor1D
	 */
	public function nonMaxSuppression(boxes:*=null,scores:*=null,maxOutputSize:*=null,iouThreshold:*=null,scoreThreshold:*=null):Tensor1D
	{
		return null;
	}


}