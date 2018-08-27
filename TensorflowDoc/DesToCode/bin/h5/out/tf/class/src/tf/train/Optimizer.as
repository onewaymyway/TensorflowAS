/*[IF-FLASH]*/
package tf.train 
{



	public class Optimizer 
	{
		
		public function Optimizer() 
		{
			
		}

	
		/**
		 * minimize
		 * @param f (() => tf.Scalar ) The function to execute and whose output to minimize.
		 * @param returnCost (boolean) Whether to return the scalar cost value produced by
	              executing f() .
		 * @param varList ( tf.Variable []) An optional list of variables to update. If specified, only
	              the trainable variables in varList will be updated by minimize. Defaults to
	              all trainable variables.
		 * @return tf.Scalar |null
		 */
		public function minimize(f:*=null,returnCost:*=null,varList:*=null):*
		{
			return ;
		}
	}

}