/*[IF-FLASH]*/
package tf
{

	import tf.Tensor4D;

	/**
	 * separableConv2d
	 * @param x ( tf.Tensor3D | tf.Tensor4D | TypedArray |Array) The input tensor, of rank 4 or rank 3, of shape [batch, height, width, inChannels] . If rank 3, batch of 1 is
              assumed.
	 * @param depthwiseFilter ( tf.Tensor4D | TypedArray |Array) The depthwise filter tensor, rank 4, of shape [filterHeight, filterWidth, inChannels, channelMultiplier] . This is
              the filter used in the first step.
	 * @param pointwiseFilter ( tf.Tensor4D | TypedArray |Array) The pointwise filter tensor, rank 4, of shape [1, 1, inChannels * channelMultiplier, outChannels] . This is
              the filter used in the second step.
	 * @param strides ([number, number]|number) The strides of the convolution: [strideHeight, strideWidth] . If strides is a single number, then strideHeight == strideWidth .
	 * @param pad ('valid'|'same') The type of padding algorithm. same and stride 1: output will be of same size as input,
              regardless of filter size. valid : output will be smaller than input if filter is larger
              than 1x1. For more info, see this guide: https://www.tensorflow.org/api_guides/python/nn#Convolution
	 * @param dilation ([number, number]|number) 
	 * @param dataFormat ('NHWC'|'NCHW') : An optional string from: "NHWC", "NCHW". Defaults to
              "NHWC". Specify the data format of the input and output data. With the
              default format "NHWC", the data is stored in the order of: [batch,
              height, width, channels]. Only "NHWC" is currently supported.
	 * @return tf.Tensor3D | tf.Tensor4D
	 */
	public function separableConv2d(x:*=null,depthwiseFilter:*=null,pointwiseFilter:*=null,strides:*=null,pad:*=null,dilation:*=null,dataFormat:*=null):Tensor4D
	{
		return null;
	}


}