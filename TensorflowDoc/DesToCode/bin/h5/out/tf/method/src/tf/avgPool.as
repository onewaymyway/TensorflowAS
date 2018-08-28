/*[IF-FLASH]*/
package tf
{

	import tf.Tensor4D;

	/**
	 * avgPool
	 * @param x ( tf.Tensor3D | tf.Tensor4D | TypedArray |Array) The input tensor, of rank 4 or rank 3 of shape [batch, height, width, inChannels] . If rank 3, batch of 1 is assumed.
	 * @param filterSize ([number, number]|number) The filter size, a tuple [filterHeight, filterWidth] .
	 * @param strides ([number, number]|number) The strides of the pooling: [strideHeight, strideWidth] .
	 * @param pad ('valid'|'same'|number) The type of padding algorithm: same and stride 1: output will be of same size as input,
              regardless of filter size. valid : output will be smaller than input if filter is larger
              than 1x1. For more info, see this guide: https://www.tensorflow.org/api_guides/python/nn#Convolution
	 * @param dimRoundingMode ('floor'|'round'|'ceil') The rounding mode used when computing output
              dimensions if pad is a number. If none is provided, it will not round
              and error if the output is of fractional size.
	 * @return tf.Tensor3D | tf.Tensor4D
	 */
	public function avgPool(x:*=null,filterSize:*=null,strides:*=null,pad:*=null,dimRoundingMode:*=null):Tensor4D
	{
		return null;
	}


}