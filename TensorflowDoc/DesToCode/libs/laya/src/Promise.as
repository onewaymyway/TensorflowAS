/*[IF-FLASH]*/package  
{
	/**
	 * ...
	 * @author ww
	 */
	public dynamic class Promise 
	{
		
		public function Promise(executor:Function) 
		{
			
		}
		public function catch1(onReject:Function):Promise
		{
		   return null;
		}
		
		public function then(onResolve:Function, onReject:Function = null):Promise
		{
			return null;
		}
		
		public static function all(promises:Array):Promise
		{
			return null;
		}
		
		public static function race(promises:Array):Promise
		{
			return null;
		}
		
		public static function reject(error:*):Promise
		{
			return null;
		}
		
		public static function resolve(value:*):Promise
		{
			return null;
		}
		
		
	}

}