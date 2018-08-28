/*[IF-FLASH]*/
package tf 
{
	import tf.Tensor1D;
	import tf.Scalar;
	import tf.Tensor2D;
	import tf.Tensor3D;
	import tf.Tensor4D;
	import tf.TensorBuffer;
	import Promise;
	import tf.Tensor;


	public class Tensor 
	{
		
		public function Tensor() 
		{
			
		}

	
		/**
		 * flatten
		 * @return tf.Tensor1D
		 */
		public function flatten():Tensor1D
		{
			return null;
		}
	
		/**
		 * asScalar
		 * @return tf.Scalar
		 */
		public function asScalar():Scalar
		{
			return null;
		}
	
		/**
		 * as1D
		 * @return tf.Tensor1D
		 */
		public function as1D():Tensor1D
		{
			return null;
		}
	
		/**
		 * as2D
		 * @param rows (number) Number of rows in tf.Tensor2D .
		 * @param columns (number) Number of columns in tf.Tensor2D .
		 * @return tf.Tensor2D
		 */
		public function as2D(rows:*=null,columns:*=null):Tensor2D
		{
			return null;
		}
	
		/**
		 * as3D
		 * @param rows (number) Number of rows in tf.Tensor3D .
		 * @param columns (number) Number of columns in tf.Tensor3D .
		 * @param depth (number) Depth of tf.Tensor3D .
		 * @return tf.Tensor3D
		 */
		public function as3D(rows:*=null,columns:*=null,depth:*=null):Tensor3D
		{
			return null;
		}
	
		/**
		 * as4D
		 * @param rows (number) Number of rows in tf.Tensor4D .
		 * @param columns (number) Number of columns in tf.Tensor4D .
		 * @param depth (number) Depth of tf.Tensor4D .
		 * @param depth2 (number) 4th dimension of tf.Tensor4D .
		 * @return tf.Tensor4D
		 */
		public function as4D(rows:*=null,columns:*=null,depth:*=null,depth2:*=null):Tensor4D
		{
			return null;
		}
	
		/**
		 * asType
		 * @param dtype ('float32'|'int32'|'bool') Data-type to cast the tensor to.
		 * @return this
		 */
		public function asType(dtype:*=null):*
		{
			return ;
		}
	
		/**
		 * buffer
		 * @return tf.TensorBuffer
		 */
		public function buffer():TensorBuffer
		{
			return null;
		}
	
		/**
		 * data
		 * @return Promise
		 */
		public function data():Promise
		{
			return null;
		}
	
		/**
		 * dataSync
		 * @return TypedArray
		 */
		public function dataSync():*
		{
			return ;
		}
	
		/**
		 * dispose
		 * @return void
		 */
		public function dispose():*
		{
			return ;
		}
	
		/**
		 * toFloat
		 * @return this
		 */
		public function toFloat():*
		{
			return ;
		}
	
		/**
		 * toInt
		 * @return this
		 */
		public function toInt():*
		{
			return ;
		}
	
		/**
		 * toBool
		 * @return this
		 */
		public function toBool():*
		{
			return ;
		}
	
		/**
		 * print
		 * @param verbose (boolean) Whether to print verbose information about the tensor,
	              including dtype and size.
		 * @return void
		 */
		public function print(verbose:*=null):*
		{
			return ;
		}
	
		/**
		 * reshape
		 * @param newShape (number[]) An array of integers defining the output tensor shape.
		 * @return tf.Tensor
		 */
		public function reshape(newShape:*=null):Tensor
		{
			return null;
		}
	
		/**
		 * reshapeAs
		 * @param x ( tf.Tensor ) The tensor of required shape.
		 * @return tf.Tensor
		 */
		public function reshapeAs(x:*=null):Tensor
		{
			return null;
		}
	
		/**
		 * expandDims
		 * @param axis (number) The dimension index at which to insert shape of 1. Defaults to
	              0 (the first dimension).
		 * @return tf.Tensor
		 */
		public function expandDims(axis:*=null):Tensor
		{
			return null;
		}
	
		/**
		 * cumsum
		 * @param axis (number) The axis along which to sum. Optional. Defaults to 0.
		 * @param exclusive (boolean) Whether to perform exclusive cumulative sum. Defaults to
	              false. If set to true then the sum of each tensor entry does not include
	              its own value, but only the values previous to it along the specified
	              axis.
		 * @param reverse (boolean) Whether to sum in the opposite direction. Defaults to
	              false.
		 * @return tf.Tensor
		 */
		public function cumsum(axis:*=null,exclusive:*=null,reverse:*=null):Tensor
		{
			return null;
		}
	
		/**
		 * squeeze
		 * @param axis (number[]) A list of numbers. If specified, only squeezes the
	              dimensions listed. The dimension index starts at 0. It is an error to
	              squeeze a dimension that is not 1.
		 * @return tf.Tensor
		 */
		public function squeeze(axis:*=null):Tensor
		{
			return null;
		}
	
		/**
		 * clone
		 * @return tf.Tensor
		 */
		public function clone():Tensor
		{
			return null;
		}
	
		/**
		 * toString
		 * @param verbose (boolean) 
		 * @return string
		 */
		public function toString(verbose:*=null):*
		{
			return ;
		}
	}

}