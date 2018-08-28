/*[IF-FLASH]*/
package tf
{

	import tf.Tensor4D;

	/**
	 * conv2dTranspose
	 * @param x ( tf.Tensor3D | tf.Tensor4D | TypedArray |Array) The input image, of rank 4 or rank 3, of shape [batch, height, width, inDepth] . If rank 3, batch of 1 is assumed.
	 * @param filter ( tf.Tensor4D | TypedArray |Array) The filter, rank 4, of shape [filterHeight, filterWidth, outDepth, inDepth] . inDepth must match inDepth in x .
	 * @param outputShape ([number, number, number, number]|[number, number, number]) Output shape, of rank 4 or rank 3: [batch, height, width, outDepth] . If rank 3, batch of 1 is assumed.
	 * @param strides ([number, number]|number) The strides of the original convolution: [strideHeight, strideWidth] .
	 * @param pad ('valid'|'same'|number) The type of padding algorithm used in the non-transpose version
              of the op.
	 * @param dimRoundingMode ('floor'|'round'|'ceil') The rounding mode used when computing output
              dimensions if pad is a number. If none is provided, it will not round
              and error if the output is of fractional size.
	 * @return tf.Tensor3D | tf.Tensor4D
	 */
	public function conv2dTranspose(x:*=null,filter:*=null,outputShape:*=null,strides:*=null,pad:*=null,dimRoundingMode:*=null):Tensor4D
	{
		return null;
	}


}