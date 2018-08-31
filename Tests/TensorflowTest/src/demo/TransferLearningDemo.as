package demo {
	import laya.utils.Handler;
	import posnet.PoseNetTools;
	import tf.layers.dense;
	import tf.layers.flatten;
	import tf.sequential;
	import tf.Sequential;
	import tf.train.adam;
	import tftool.ImageTools;
	import tftool.MobileNetTool;
	import view.TransferControlView;
	
	/**
	 * ...
	 * @author ww
	 */
	public class TransferLearningDemo extends DemoBase {
		
		public function TransferLearningDemo() {
			super();
			useVideo = true;
		
		}
		
		override protected function initModels():void {
			var path:String;
			//path = "http://10.10.20.40/mobilenet_v1_0.25_224/model.json";
			path = "http://localhost/mobilenet_v1_0.25_224/model.json";
			MobileNetTool.loadMobileNet(path, new Handler(this, onModelLoaded),true);
		}
		
		private var modelO:Object;
		
		private function onModelLoaded(modelO:*):void {
			this.modelO = modelO;
			modelInited();
		}
		
		public var denseUnits:int = 100;
		public var NUM_CLASSES:int = 4;
		public var learningRate:Number = 0.0005;
		public var epoches:int = 20;
		public var batchsize:Number = 0.4;
		public var model:Sequential;
		
		private function createTransferModel():void {
			
			var layers:Array;
			layers = [];
			layers.push(flatten({inputShape: [7, 7, 256]}));
			layers.push(dense({units: denseUnits, activation: 'relu', kernelInitializer: 'varianceScaling', useBias: true}));
			
			layers.push(dense({units: NUM_CLASSES, kernelInitializer: 'varianceScaling', useBias: false, activation: 'softmax'}));
			
			model = sequential({layers: layers});
			// Creates the optimizers which drives training of the model.
			var optimizer:* = adam(learningRate);
			// We use categoricalCrossentropy which is the loss function we use for
			// categorical classification which measures the error between our predicted
			// probability distribution over classes (probability that an input is of each
			// class), versus the label (100% probability in the true class)>
			model.compile({optimizer: optimizer, loss: 'categoricalCrossentropy'});
		
		}
		
		override protected function allInited():void {
			super.allInited();
			ImageTools.adptElementToSize(video);
			addUI();
		}
		
		private function addUI():void
		{
			createTransferModel();
			var tui:TransferControlView;
			tui = new TransferControlView();
			tui.pos(0, 250);
			tui.video = video;
			tui.mobileNet = modelO;
			tui.myModelO = model;
			Laya.stage.addChild(tui);
		}
	}

}