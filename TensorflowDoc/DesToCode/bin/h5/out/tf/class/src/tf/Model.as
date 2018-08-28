/*[IF-FLASH]*/
package tf 
{
	import Promise;
	import tf.layers.Layer;


	public class Model 
	{
		
		public function Model() 
		{
			
		}

	
		/**
		 * summary
		 * @param lineLength (number) Custom line length, in number of characters.
		 * @param positions (number[]) Custom widths of each of the columns, as either
	              fractions of lineLength (e.g., [0.5, 0.75, 1] ) or absolute number
	              of characters (e.g., [30, 50, 65] ). Each number corresponds to
	              right-most (i.e., ending) position of a column.
		 * @param printFn ((message?: tf.any() , ...optionalParams: tf.any() []) => void) Custom print function. Can be used to replace the default console.log . For example, you can use x => {} to mute the printed
	              messages in the console.
		 * @return void
		 */
		public function summary(lineLength:*=null,positions:*=null,printFn:*=null):*
		{
			return ;
		}
	
		/**
		 * compile
		 * @param config (Object) a ModelCompileConfig specifying the loss, optimizer, and
	              metrics to be used for fitting and evaluating this model.
		 * @return void
		 */
		public function compile(config:*=null):*
		{
			return ;
		}
	
		/**
		 * evaluate
		 * @param x ( tf.Tensor | tf.Tensor []) tf.Tensor of test data, or an Array of tf.Tensor s if the model has
	              multiple inputs.
		 * @param y ( tf.Tensor | tf.Tensor []) tf.Tensor of target data, or an Array of tf.Tensor s if the model
	              has multiple outputs.
		 * @param config (Object) A ModelEvaluateConfig , containing optional fields.
		 * @return tf.Scalar | tf.Scalar []
		 */
		public function evaluate(x:*=null,y:*=null,config:*=null):*
		{
			return ;
		}
	
		/**
		 * predict
		 * @param x ( tf.Tensor | tf.Tensor []) The input data, as an Tensor, or an Array of tf.Tensor s if
	              the model has multiple inputs.
		 * @param config (Object) A ModelPredictConfig object containing optional fields.
		 * @return tf.Tensor | tf.Tensor []
		 */
		public function predict(x:*=null,config:*=null):*
		{
			return ;
		}
	
		/**
		 * predictOnBatch
		 * @param x ( tf.Tensor ) : Input samples, as an Tensor
		 * @return tf.Tensor | tf.Tensor []
		 */
		public function predictOnBatch(x:*=null):*
		{
			return ;
		}
	
		/**
		 * fit
		 * @param x ( tf.Tensor | tf.Tensor []|{[inputName: string]: tf.Tensor }) tf.Tensor of training data, or an array of tf.Tensor s if the model
	              has multiple inputs. If all inputs in the model are named, you can also
	              pass a dictionary mapping input names to tf.Tensor s.
		 * @param y ( tf.Tensor | tf.Tensor []|{[inputName: string]: tf.Tensor }) tf.Tensor of target (label) data, or an array of tf.Tensor s if the
	              model has multiple outputs. If all outputs in the model are named, you
	              can also pass a dictionary mapping output names to tf.Tensor s.
		 * @param config (Object) A ModelFitConfig , containing optional fields.
		 * @return Promise
		 */
		public function fit(x:*=null,y:*=null,config:*=null):Promise
		{
			return null;
		}
	
		/**
		 * save
		 * @param handlerOrURL (io.IOHandler|string) An instance of IOHandler or a URL-like,
	              scheme-based string shortcut for IOHandler .
		 * @param config (Object) Options for saving the model.
		 * @return Promise
		 */
		public function save(handlerOrURL:*=null,config:*=null):Promise
		{
			return null;
		}
	
		/**
		 * getLayer
		 * @param name (string) Name of layer.
		 * @param index (number) Index of layer.
		 * @return tf.layers.Layer
		 */
		public function getLayer(name:*=null,index:*=null):Layer
		{
			return null;
		}
	}

}