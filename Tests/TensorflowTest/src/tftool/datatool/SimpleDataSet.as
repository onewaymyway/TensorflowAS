package tftool.datatool {
	import tf.keep;
	import tf.oneHot;
	import tf.tensor1d;
	import tf.tidy;
	
	/**
	 * ...
	 * @author ww
	 */
	public class SimpleDataSet {
		public var numClasses:int = 4;
		
		public function SimpleDataSet() {
		
		}
		
		public function addExample(example, label):void {
			// One-hot encode the label.
			var y = tidy(function():* {
					return oneHot(tensor1d([label]).toInt(), this.numClasses)
				});
			
			if (this.xs == null) {
				// For the first example that gets added, keep example and y so that the
				// ControllerDataset owns the memory of the inputs. This makes sure that
				// if addExample() is called in a tf.tidy(), these Tensors will not get
				// disposed.
				this.xs = keep(example);
				this.ys = keep(y);
			}
			else {
				var oldX = this.xs;
				this.xs = keep(oldX.concat(example, 0));
				
				var oldY = this.ys;
				this.ys = keep(oldY.concat(y, 0));
				
				oldX.dispose();
				oldY.dispose();
				y.dispose();
			}
		}
	}

}