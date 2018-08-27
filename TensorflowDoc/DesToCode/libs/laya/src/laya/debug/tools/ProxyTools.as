package laya.debug.tools 
{
	import laya.utils.Browser;
	/**
	 * ...
	 * @author ww
	 */
	public class ProxyTools 
	{
		
		public function ProxyTools() 
		{
			
		}
		public static function createTableProxy(tableName:String,childDepth:int,keys:Array=null,getValueFun:Function=null,wrapTarget:*=null):*
		{
			var Proxy:Class = Browser.window.Proxy;
			var dataO:Object;
			dataO = wrapTarget||{ };
			dataO.key = tableName;
			dataO.dKeys = keys;
			dataO.childDepth = childDepth;
			dataO.valueFun = getValueFun;

			var tableProxy:*;
			tableProxy = new Proxy( dataO, { get: function(target:Object, property:String):* {
					trace("getKey:", target, property);
					if (target is Array&&target.dKeys&&target.dKeys.indexOf(property) >= 0)
					{
						return target[0][property];
					}
	
					return target[property];
						
				}});
			return tableProxy;
		}
	}

}