/*[IF-FLASH]*/
package tf
{

	import tf.Tensor3D;

	/**
	 * conv1d
	 * @param x ( tf.Tensor2D | tf.Tensor3D | TypedArray |Array) The input tensor, of rank 3 or rank 2, of shape [batch, width, inChannels] . If rank 2, batch of 1 is assumed.
	 * @param filter ( tf.Tensor3D | TypedArray |Array) The filter, rank 3, of shape [filterWidth, inDepth, outDepth] .
	 * @param stride (number) The number of entries by which the filter is moved right at
              each step.
	 * @param pad ('valid'|'same'|number) The type of padding algorithm. same and stride 1: output will be of same size as input,
              regardless of filter size. valid : output will be smaller than input if filter is larger
              than 1x1. For more info, see this guide: https://www.tensorflow.org/api_guides/python/nn#Convolution
	 * @param dataFormat ('NWC'|'NCW') An optional string from "NWC", "NCW". Defaults to "NWC",
              the data is stored in the order of [batch, in_width, in_channels]. Only
              "NWC" is currently supported.
	 * @param dilation (number) The dilation rate in which we sample input values in
              atrous convolution. Defaults to 1 . If it is greater than 1, then
              stride must be 1 .
	 * @param dimRoundingMode ('floor'|'round'|'ceil') The rounding mode used when computing output
              dimensions if pad is a number. If none is provided, it will not round
              and error if the output is of fractional size.
	 * @return tf.Tensor2D | tf.Tensor3D
	 */
	public function conv1d(x:*=null,filter:*=null,stride:*=null,pad:*=null,dataFormat:*=null,dilation:*=null,dimRoundingMode:*=null):Tensor3D
	{
		return null;
	}


}