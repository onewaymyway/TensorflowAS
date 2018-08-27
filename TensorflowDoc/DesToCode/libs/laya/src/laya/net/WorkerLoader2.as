package laya.net 
{
	import laya.events.EventDispatcher;
	import laya.renders.Render;
	import laya.resource.HTMLCanvas;
	import laya.utils.Browser;

	/**
	 * @private
	 * Worker Image加载器
	 */
	public class WorkerLoader2 extends EventDispatcher
	{
		/**
		 * 图片加载完成事件
		 */
		public static const IMAGE_LOADED:String = "image_loaded";
		/**
		 * 图片加载失败事件
		 */
		public static const IMAGE_ERR:String = "image_err";
		/**
		 * 图片加载过程中的信息
		 */
		public static const IMAGE_MSG:String = "image_msg";
		
		/**
		 * 实例
		 */
		public static var I:WorkerLoader2;
		/**
		 * @private
		 */
		private static var _preLoadFun:Function;
		/**
		 * @private
		 */
		private static var _enable:Boolean = false;
		/**
		 * worker.js的路径
		 */
		public static var workerPath:String = "libs/worker.js";
		
		/**
		 * 尝试使用Work加载Image
		 * @return 是否启动成功
		 */
		public static function __init__():Boolean
		{
			if (_preLoadFun != null) return false;
			if (!Browser.window.Worker) return false;
			_preLoadFun = Loader["prototype"]["_loadImage"];
			Loader["prototype"]["_loadImage"] = WorkerLoader2["prototype"]["_loadImage"];
			if (!I) I = new WorkerLoader2();
			return true;
		}
		
		/**
		 * 是否支持worker
		 * @return 是否支持worker
		 */
		public static function workerSupported():Boolean
		{
			return Browser.window.Worker?true:false;
		}
		/**
		 * 是否启用。
		 */
		public static function set enable(v:Boolean):void
		{
			_enable = v;
			if (_enable && _preLoadFun == null) __init__();
		}
		
		public static function get enable():Boolean
		{
			return _enable;
		}
		
		/**
		 * 使用的Worker对象。
		 */
		public var worker:Worker ;
		public function WorkerLoader2() 
		{
			worker = new Browser.window.Worker(workerPath);
			worker.onmessage = function(evt:*):void { 
				//接收worker传过来的数据函数
				workerMessage(evt.data);
			}
		}
		/**
		 * @private
		 */
		private function workerMessage(data:*):void
		{
			if (data)
			{
				switch(data.type)
				{
					case "Image":
						if (Render.isWebGL)
						{
							imageLoadedWebGL(data);
						}else
						{
							imageLoadedCanvas(data);
						}
						break;
					case "Msg":
						event(IMAGE_MSG, data.msg);
						break;
				}
			}
		}
		
		private static var tempCanvas:HTMLCanvas;
		/**
		 * @private
		 */
		private function imageLoadedWebGL(data:*):void
		{
			if (data && data.buffer && data.buffer.length < 10)
			{
				_enable = false;
				_myTrace("buffer lost when postmessage ,disable workerloader");
				event(data.url, null);
				event(IMAGE_ERR, data.url+"\n"+data.msg);
				return;
			}
			if (!data.dataType)
			{
				event(data.url, null);
				event(IMAGE_ERR, data.url+"\n"+data.msg);
				return;
			}
			
			var canvas:*;
			var ctx:*;
			
			var imageData:*;
			switch(data.dataType)
			{
				case "buffer":

					canvas = { source: { imageData:new Uint8Array(data.buffer),width:data.width, height:data.height }};
					canvas._w = data.width;

					break;
				case "imagedata":
					//imageData = data.imagedata;
					//canvas.size(imageData.width, imageData.height);
			        //ctx.putImageData(imageData, 0, 0);
					imageData = data.imagedata;

					canvas = { source: { imageData:imageData.data.buffer,width:imageData.width, height:imageData.height }};
					canvas._w = imageData.width;
					break;
				case "imageBitmap":
					if (!tempCanvas)
					{
						tempCanvas = new HTMLCanvas("2D");
					}
					canvas = tempCanvas;
					ctx = canvas.source.getContext("2d");   
					imageData = data.imageBitmap;
					canvas.size(imageData.width, imageData.height);
					ctx.clearRect(0, 0, imageData.width, imageData.height);
					ctx.drawImage(imageData, 0, 0);
					
					canvas = { source: { imageData:new Uint8Array(ctx.getImageData(0, 0, imageData.width, imageData.height).data.buffer),width:imageData.width, height:imageData.height }};
					canvas._w = imageData.width;
					
					break;
				
			}

			__JS__("canvas=new laya.webgl.resource.WebGLImage(canvas,data.url);");
		
			event(data.url, canvas);
			
		}
		/**
		 * @private
		 */
		private function imageLoadedCanvas(data:*):void
		{
			if (data && data.buffer && data.buffer.length < 10)
			{
				_enable = false;
				_myTrace("buffer lost when postmessage ,disable workerloader");
				event(data.url, null);
				event(IMAGE_ERR, data.url+"\n"+data.msg);
				return;
			}
			if (!data.dataType)
			{
				event(data.url, null);
				event(IMAGE_ERR, data.url+"\n"+data.msg);
				return;
			}
			
			var canvas:HTMLCanvas = new HTMLCanvas("2D");
			var ctx:*;
			ctx = canvas.source.getContext("2d");   
			
			var imageData:*;
			switch(data.dataType)
			{
				case "buffer":
					 imageData = ctx.createImageData(data.width, data.height);
			         imageData.data.set(data.buffer);
					 canvas.size(imageData.width, imageData.height);
			         ctx.putImageData(imageData, 0, 0);
					break;
				case "imagedata":
					imageData = data.imagedata;
					canvas.size(imageData.width, imageData.height);
			        ctx.putImageData(imageData, 0, 0);
					imageData = data.imagedata;
					break;
				case "imageBitmap":
					imageData = data.imageBitmap;
					canvas.size(imageData.width, imageData.height);
					ctx.drawImage(imageData, 0, 0);
					break;
				
			}
			if (Render.isWebGL)
			{
				__JS__("canvas=new laya.webgl.resource.WebGLImage(canvas,data.url);");
				
			}
			event(data.url, canvas);
		}
		
		/**
		 * @private
		 */
		private function _myTrace(...arg):void
		{
			var rst:Array=[];
			var i:int,len:int=arg.length;		
			for(i=0;i<len;i++)
			{
				rst.push(arg[i]);
			}
			event(IMAGE_MSG, rst.join(" "));
		}
		
		/**
		 * 加载图片
		 * @param	url 图片地址
		 */
		public function loadImage(url:String):void
		{
			var data:Object;
			data = { };
			data.type = "load";
			data.url = url;
			worker.postMessage(data);
		}
		
		/**
		 * @private
		 * 加载图片资源。
		 * @param	url 资源地址。
		 */
		protected function _loadImage(url:String):void {
			var _this:Loader = this as Loader;
			if (!_enable||url.toLowerCase().indexOf(".png") < 0)
			{
				_preLoadFun.call(_this, url);
				return;
			}
			url = URL.formatURL(url);
			function clear():void {
				WorkerLoader2.I.off(url, _this, onload);
			}
			
			var onload:Function = function(image:*):void {
				clear();
				if (image)
				{
					_this["onLoaded"](image);
				}else
				{
					//失败之后使用原版的加载函数加载重试
					//_this.event(Event.ERROR, "Load image failed");
					_preLoadFun.call(_this, url);
					
				}
				
			};
			WorkerLoader2.I.on(url, _this, onload);
			WorkerLoader2.I.loadImage(url);
		}
		
	}

}