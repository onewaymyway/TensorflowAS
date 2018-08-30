package tftool 
{
	import laya.utils.Handler;
	import tf.loadModel;
	import tf.model;
	/**
	 * ...
	 * @author ww
	 */
	public class MobileNetTool 
	{
		
		public function MobileNetTool() 
		{
			
		}
		
		public static function loadMobileNet(path:String,complete:Handler,forTransform:Boolean=false):void
		{
			if (!path) path = "https://storage.googleapis.com/tfjs-models/tfjs/mobilenet_v1_0.25_224/model.json";
			loadModel(path).then(
			function(mobilenet:*):*
			{
				if (!forTransform)
				{
					complete.runWith(mobilenet);
					return;
				}
				var layer:* = mobilenet.getLayer('conv_pw_13_relu');
				var modelO:*;
				modelO = model({inputs: mobilenet.inputs, outputs: layer.output});
				complete.runWith(modelO);
			}
			);
		}
		
		public static function predict(modelO:*,ele:*, topK:int, complete:Handler):void
		{
			var img:* = ImageTools.elementToTFImage(ele);
			modelO.predict(img).data().then(
			function(rst:*):*
			{
				
				var clist:Array = ImageClass.getTopKClasses(rst, 4);
				//trace("class:", clist);
				complete.runWith([clist]);
			}
			)
		}
	
	}

}