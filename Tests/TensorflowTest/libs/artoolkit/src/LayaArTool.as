package {
	import laya.debug.tools.DebugTxt;
	import laya.utils.Browser;
	import laya.utils.Handler;
	
	/**
	 * ...
	 * @author ww
	 */
	public class LayaArTool {
		
		public function LayaArTool() {
		
		}
		
		public static function createVideo():* {
			var video:*;
			video = Browser.createElement("video");
			Browser.document.body.appendChild(video);
			var style:*;
			style = video.style;
			style.position = "absolute";
			style.left = "0px";
			style.top = "0px";
			return video;
		}
		
		public static function initVideoBySrc(video:*, src:String, handler:Handler):void {
			video.src = src;
			video.loop = "loop";
			video.onloadedmetadata = function(e) {
				handler.runWith(video);
			};
		}
		
		public static function initPCCamara(video:*, handler:Handler):void {
			var constraints:* = {video: true};
			function handleSuccess(stream:*):void {
				window.stream = stream; // only to make stream available to console
				video.srcObject = stream;
				handler.run();
			}
			
			function handleError(error) {
				trace('getUserMedia error: ', error);
			}
			
			Browser.window.navigator.mediaDevices.getUserMedia(constraints).then(handleSuccess).catch(handleError);
		}
		
		public static function initCamaraNew(video:*, handler:Handler):void {
			var exArray = []; //存储设备源ID 
			var navigator:* = Browser.window.navigator;
			var MediaStreamTrack:* = Browser.window.MediaStreamTrack;
			DebugTxt.dTrace("navigator.getUserMedia" + navigator.getUserMedia);
			DebugTxt.dTrace("MediaStreamTrack2", Browser.window.MediaStreamTrack);
			if (MediaStreamTrack && MediaStreamTrack.getSources) {
			}
			else {
				initCamaraVideo(video, handler);
				return;
			}
			DebugTxt.dTrace("MediaStreamTrack.getSources", Browser.window.MediaStreamTrack.getSources);
			if (navigator.getUserMedia) {
				DebugTxt.dTrace("MediaStreamTrack.getSources", MediaStreamTrack.getSources);
				MediaStreamTrack.getSources(function(sourceInfos) {
						for (var i = 0; i != sourceInfos.length; ++i) {
							var sourceInfo = sourceInfos[i];
							//这里会遍历audio,video，所以要加以区分 
							if (sourceInfo.kind === 'video') {
								exArray.push(sourceInfo.id);
							}
						}
						var mediaCfg:Object;
						mediaCfg = {'video': {'optional': [{'sourceId': exArray[1]}], 'audio': false}}
						DebugTxt.dTrace("navigator.getUserMedia");
						navigator.getUserMedia(mediaCfg, function(stream) {
								DebugTxt.dTrace("onCamaraOk");
								onCamaraOk(video, stream, handler);
							}, onCamaraErr);
					});
			}
		}
		
		public static function initCamaraNew2(video:*, handler:Handler):void {
			var exArray = []; //存储设备源ID 
			var navigator:* = Browser.window.navigator;
			if (navigator.mediaDevices && navigator.mediaDevices.enumerateDevices) {
				navigator.mediaDevices.enumerateDevices().then(gotDevices);
				
			}
			else {
				initCamaraNew(video, handler);
				return;
			}
			
			var audioArray = [];
			function gotDevices(deviceInfos) {
				for (var i = 0; i !== deviceInfos.length; ++i) {
					var deviceInfo = deviceInfos[i];
					
					if (deviceInfo.kind === 'audioinput') {
						audioArray.push(deviceInfo.deviceId || 'microphone ' + (audioArray.length + 1));
					}
					else if (deviceInfo.kind === 'videoinput') {
						var key:String;
						for (key in deviceInfo) {
							DebugTxt.dTrace(key, deviceInfo[key]);
						}
						exArray.push(deviceInfo.deviceId || 'camera ' + (exArray.length + 1));
					}
					else {
						console.log('Found one other kind of source/device: ', deviceInfo);
					}
				}
				DebugTxt.dTrace("deviceId:", exArray[1]);
				//var mediaCfg:Object;
				//mediaCfg = { 'video': { deviceId: { exact: exArray[1] }}, 'audio': false };
				//mediaCfg = {'video': {'optional': [{'deviceId': exArray[1]}], 'audio': false}};
				//DebugTxt.dTrace("navigator.getUserMedia");
				//navigator.getUserMedia(mediaCfg, function(stream) {
				//DebugTxt.dTrace("onCamaraOk");
				//onCamaraOk(video, stream, handler);
				//}, onCamaraErr);
				
				var constraints = {audio: false, video: {deviceId: {exact: exArray[1]}}};
				
				navigator.mediaDevices.getUserMedia(constraints).then(gotStream);
				
				function gotStream(stream) {
					DebugTxt.dTrace("gotStream");
					onCamaraOk(video, stream, handler);
				}
			}
		}
		
		private static function onCamaraErr(error) {
			alert(error.name);
		}
		
		private static function onCamaraOk(video:*, stream, handler:Handler):void {
			//DebugTxt.dTrace("onCamaraOk");
			video.src = Browser.window.URL.createObjectURL(stream);
			video.onloadedmetadata = function(e) {
				DebugTxt.dTrace("onloadedmetadata");
				handler.runWith(video);
			};
		}
		
		public static function initCamaraVideo(video:*, handler:Handler):void {
			var navigator:* = Browser.window.navigator;
			var videoObj = {"video": true};
			var errBack = function(error) {
				alert(error.name);
			};
			var _this:* = this;
			if (navigator.getUserMedia) { // 标准
				navigator.getUserMedia(videoObj, function(stream) {
					//alert("type getUserMedia")
					//video.src = stream;
						video.src = Browser.window.URL.createObjectURL(stream);
						video.onloadedmetadata = function(e) {
							
							handler.runWith(video);
						};
					
					}, onCamaraErr);
			}
			else if (navigator.webkitGetUserMedia) { // WebKit浏览器
				navigator.webkitGetUserMedia(videoObj, function(stream) {
					//alert("type webkitGetUserMedia")
						video.src = Browser.window.webkitURL.createObjectURL(stream);
						video.onloadedmetadata = function(e) {
							handler.runWith(video);
						};
					}, onCamaraErr);
			}
			else if (navigator.mozGetUserMedia) { // Firefox浏览器
				navigator.mozGetUserMedia(videoObj, function(stream) {
					//alert("type mozGetUserMedia")
						video.src = Browser.window.URL.createObjectURL(stream);
						video.onloadedmetadata = function(e) {
							handler.runWith(video);
						};
					}, onCamaraErr);
			}
		}
	}

}