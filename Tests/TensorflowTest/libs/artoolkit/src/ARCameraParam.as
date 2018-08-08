/*[IF-FLASH]*/
package {
	
	/**
	 * ...
	 * @author ww
	 */
	public class ARCameraParam {
		public var src:String;
		public var onload:Function;
		public function ARCameraParam(src, onload, onerror) {
		
		}
		
		/**
		   Loads the given URL as camera parameters definition file into this ARCameraParam.
		
		   Can only be called on an unloaded ARCameraParam instance.
		
		   @param {string} src URL to load.
		 */
		public function load(src):void {
		
		}
		;
		
		/**
		   Destroys the camera parameter and frees associated Emscripten resources.
		
		 */
		public function dispose():void {
		
		}
		;
	}

}