/*[IF-FLASH]*/
package tf
{



	/**
	 * setBackend
	 * @param backendName (string) The name of the backend. Currently supports 'webgl'|'cpu' in the browser, and 'tensorflow' under node.js
              (requires tfjs-node).
	 * @param safeMode (boolean) Defaults to false. In safe mode, you are forced to
              construct tensors and call math operations inside a tidy() which
              will automatically clean up intermediate tensors.
	 * @return void
	 */
	public function setBackend(backendName:*=null,safeMode:*=null):*
	{
		return ;
	}


}