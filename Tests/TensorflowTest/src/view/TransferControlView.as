package view {
	import laya.events.Event;
	import tf.Model;
	import tf.tidy;
	import tftool.datatool.SimpleDataSet;
	import tftool.ImageTools;
	import ui.demo.TransferLearningUI;
	
	/**
	 * ...
	 * @author ww
	 */
	public class TransferControlView extends TransferLearningUI {
		
		public function TransferControlView() {
			inits();
			resetSample();
		}
		public var video:*;
		private var dataset:SimpleDataSet;
		public static var dirDic:Object = { "left":1, "right":2, "up":3, "down":0 };
		public static var dirStrDic:Object = { };
		private var labelCountDic:Object = { };
		public var mobileNet:Model;
		public var myModelO:Model;
		public var curState:String;
		public var isPlaying:Boolean = false;
		public function resetSample():void
		{
			labelCountDic = { "left":0, "right":0, "up":0, "down":0 };
			dataset.clear();
			updateSampleStat();
		}
		
		private function updateSampleStat():void
		{
			var strs:Array;
			strs = [];
			var key:String;
			for (key in labelCountDic)
			{
				strs.push(key+":"+labelCountDic[key]);
			}
			dataTxt.text = strs.join("\n");
		}
		private function inits():void {
			dataset = new SimpleDataSet();
			var key:String;
			for (key in dirDic)
			{
				dirStrDic[dirDic[key]] = key;
			}
			this.on(Event.CLICK, this, onClick);
		}
		
		public static function getDirStr(dir:int):void
		{
			return dirStrDic[dir];
		}
		public static function getDirByStr(dir:String):int
		{
			return dirDic[dir];
		}
		
		private function onClick(e:Event):void {
			var target:*;
			target = e.target;
			//trace("target:", target);
			switch (target) {
				case trainBtn:
					onTrain();
					break;
				case playBtn:
					onPlay();
					break;
				case leftBtn:
					addSample("left");
					break;
				case rightBtn:
					addSample("right");
					break;
				case upBtn:
					addSample("up");
					break;
				case downBtn:
					addSample("down");
					break;
			}
		}
		
		public var batchsizerate:Number = 0.4;
		public var epoches:int = 20;
		private function onTrain():void
		{
			var batchSize:int = Math.floor(dataset.xs.shape[0] * batchsizerate);
			myModelO.fit(dataset.xs, dataset.ys, { batchSize:batchSize, epochs:epoches } ).then(
				function():void
				{
					trainComplete();
				}
				)
		}
		
		private function trainComplete():void
		{
			trace("trainComplete");
		}
		
		
		
		private function onPlay():void
		{
			if (!isPlaying)
			{
				isPlaying = true;
				Laya.timer.loop(100, this, predict,null,true);
			}else
			{
				isPlaying = false;
				Laya.timer.clear(this, predict);
			}
			
			
		}
		
		private function predict():void
		{
			var predictRst:*=tidy(
			  function():*
			  {
				  var img:*;
				img = ImageTools.captureImgFromVideo(video);
				
				var activation:*;
				activation = mobileNet.predict(img);
				
				var predictions:*;
				predictions = myModelO.predict(activation);
				
				var rst:int;
				rst = predictions.as1D().argMax();
				return rst;
			  }
			)
			var rstID:int;
			rstID = predictRst.dataSync()[0];
			trace("rst:",rstID,getDirStr(rstID));
			curState=getDirStr(rstID);
			resultTxt.text = "Action:" + curState;
			
			
			
		}
		
		private function addSample(label:String):void
		{
			labelCountDic[label] += 1;
			updateSampleStat();
			var labelId:int;
			labelId = getDirByStr(label);
			var img:*;
			img = ImageTools.captureImgFromVideo(video);
			img = mobileNet.predict(img);
			dataset.addExample(img, labelId);
		}
	}

}