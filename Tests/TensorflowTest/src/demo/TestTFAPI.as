package demo {
	import tf.layers.dense;
	import tf.Model;
	import tf.sequential;
	import tf.Sequential;
	import tf.Tensor;
	import tf.tensor2d;
	import tf.Tensor2D;
	
	/**
	 * ...
	 * @author ww
	 */
	public class TestTFAPI {
		
		public function TestTFAPI() {
			test();
		}
		
		private function test():void {
			// A sequential model is a container which you can add layers to.
			var model:Sequential = sequential();
			
			// Add a dense layer with 1 output unit.
			model.add(dense({units: 1, inputShape: [1]}));
			
			// Specify the loss type and optimizer for training.
			model.compile({loss: 'meanSquaredError', optimizer: 'SGD'});
			
			// Generate some synthetic data for training.
			var xs:Tensor2D = tensor2d([[1], [2], [3], [4]], [4, 1]);
			var ys:Tensor2D = tensor2d([[1], [3], [5], [7]], [4, 1]);
			
			// Train the model.
			model.fit(xs, ys, {epochs: 500}).then(function() {
				// Ater the training, perform inference.
					var output:Tensor = model.predict(tensor2d([[5]], [1, 1]));
					output.print();
				})
		
		}
	}

}