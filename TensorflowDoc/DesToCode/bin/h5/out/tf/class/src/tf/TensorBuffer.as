/*[IF-FLASH]*/
package tf 
{
	import tf.Tensor;


	public class TensorBuffer 
	{
		
		public function TensorBuffer() 
		{
			
		}

	
		/**
		 * set
		 * @param value (number) The value to set.
		 * @param ...locs (number[]) The location indices.
		 * @return void
		 */
		public function set(value:*=null,...locs:*=null):*
		{
			return ;
		}
	
		/**
		 * get
		 * @param ...locs (number[]) The location indices.
		 * @return number
		 */
		public function get(...locs:*=null):*
		{
			return ;
		}
	
		/**
		 * toTensor
		 * @return tf.Tensor
		 */
		public function toTensor():Tensor
		{
			return null;
		}
	}

}