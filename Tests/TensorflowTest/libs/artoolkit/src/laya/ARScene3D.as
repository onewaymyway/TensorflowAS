package laya {
	import laya.d3.core.Camera;
	import laya.d3.core.scene.Scene;
	import ARController;
	import ARCameraParam;
	import laya.d3.math.Matrix4x4;
	import laya.utils.Browser;
	import laya.utils.Handler;
	
	/**
	 * ...
	 * @author ww
	 */
	public class ARScene3D {
		
		public function ARScene3D() {
			scene = new Scene();
			camera = new Camera(0, 1, 100);
		
		}
		public var scene:Scene;
		public var video:*;
		public var camaraParam:ARCameraParam;
		public var arController:ARController;
		public var cameraConfigPath:String;
		public var videoPath:String = "Data/output_4.ogg";
		public var camera:Camera;
		public var completeHandler:Handler;
		public function load(completeHandler:Handler = null):void {
			this.completeHandler;
			if (!video) {
				video = LayaArTool.createVideo();
				video.style["z-index"] = -1;
			}
			
			var videoOkHandler:Handler;
			
			videoOkHandler = new Handler(this, beginWork, [video]);
			//LayaArTool.initVideoBySrc(video, "Data/output_4.ogg", completeHandler);
			//LayaArTool.initCamaraNew(video, completeHandler);
			//LayaArTool.initCamaraVideo(video,completeHandler);
			if (Browser.onPC) {
				LayaArTool.initVideoBySrc(video, "Data/output_4.ogg", videoOkHandler);
			}
			else {
				if (Browser.onWeiXin) {
					LayaArTool.initCamaraNew(video, videoOkHandler);
				}
				else {
					LayaArTool.initCamaraVideo(video, videoOkHandler);
				}
			}
		}
		
		private function beginWork(video:*):void {
			this.video = video;
			video.play();
			
			camaraParam = new ARCameraParam();
			camaraParam.onload = Utils.bind(camaraLoaded, this);
			camaraParam.load("Data/camera_para.dat");
		}
		public var videoScaleRate:Number;
		
		private function camaraLoaded():void {
			
			var cScale:Number;
			cScale = 0.25;
			cScale = 0.5;
			//cScale = 2;
			videoScaleRate = Browser.pixelRatio / cScale;
			trace("size:", video.videoWidth, video.videoHeight);
			Laya.stage.size(video.videoWidth * Browser.pixelRatio, video.videoHeight * Browser.pixelRatio);
			arController = new ARController(video.videoWidth * cScale, video.videoHeight * cScale, camaraParam);
			
			var camera_mat:Array = arController.getCameraMatrix();
			var mat:Matrix4x4 = new Matrix4x4();
			
			mat.elements.set(camera_mat);
			
			camera.projectionMatrix = mat;
			
			this.completeHandler.run();
			//Laya.timer.frameLoop(2, this, loop);
		}
	}

}