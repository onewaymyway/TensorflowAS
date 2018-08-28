/*[IF-FLASH]*/
package tf
{

	import tf.Tensor4D;

	/**
	 * conv2d
	 * @param x ( tf.Tensor3D | tf.Tensor4D | TypedArray |Array) The input tensor, of rank 4 or rank 3, of shape [batch, height, width, inChannels] . If rank 3, batch of 1 is
              assumed.
	 * @param filter ( tf.Tensor4D | TypedArray |Array) The filter, rank 4, of shape [filterHeight, filterWidth, inDepth, outDepth] .
	 * @param strides ([number, number]|number) The strides of the convolution: [strideHeight, strideWidth] .
	 * @param pad ('valid'|'same'|number) The type of padding algorithm. same and stride 1: output will be of same size as input,
              regardless of filter size. valid : output will be smaller than input if filter is larger
              than 1x1. For more info, see this guide: https://www.tensorflow.org/api_guides/python/nn#Convolution
	 * @param dataFormat ('NHWC'|'NCHW') : An optional string from: "NHWC", "NCHW". Defaults to
              "NHWC". Specify the data format of the input and output data. With the
              default format "NHWC", the data is stored in the order of: [batch,
              height, width, channels]. Only "NHWC" is currently supported.
	 * @param dilations ([number, number]|number) The dilation rates: [dilationHeight, dilationWidth] in which we sample input values across the height and width dimensions
              in atrous convolution. Defaults to [1, 1] . If dilations is a single
              number, then dilationHeight == dilationWidth . If it is greater than
              1, then all values of strides must be 1.
	 * @param dimRoundingMode ('floor'|'round'|'ceil') The rounding mode used when computing output
              dimensions if pad is a number. If none is provided, it will not round
              and error if the output is of fractional size.
	 * @return tf.Tensor3D | tf.Tensor4D
	 */
	public function conv2d(x:*=null,filter:*=null,strides:*=null,pad:*=null,dataFormat:*=null,dilations:*=null,dimRoundingMode:*=null):Tensor4D
	{
		return null;
	}


}