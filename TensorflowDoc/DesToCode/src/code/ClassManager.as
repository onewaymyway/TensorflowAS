package code 
{
	/**
	 * ...
	 * @author ww
	 */
	public class ClassManager 
	{
		
		public function ClassManager() 
		{
			
		}
		
		private static var _clzDic:Object = { };
		public static function addClz(clzFullPath:String):void
		{
			_clzDic[getShorClass(clzFullPath)] = clzFullPath;
		}
		
		public static function hasClass(clzPath:String):Boolean
		{
			clzPath = getShorClass(clzPath);
			if (_clzDic[clzPath])
			{
				return true;
			}
			return false;
		}
		
		public static function getShorClass(clzPath:String):String
		{
			if (clzPath.indexOf(".") < 0) return clzPath;
			var p:Array;
			p = clzPath.split(".");
			return p[p.length-1];
		}
		public static function getFullPath(clz:String):String
		{
			if (clz.indexOf(".") >= 0) return clz;
			if (hasClass(clz)) return _clzDic[clz];
			return clz;
		}
		public static function setClassList(clzList:Array):void
		{
			var i:int, len:int;
			len = clzList.length;
			for (i = 0; i < len; i++)
			{
				addClz(clzList[i].name);
			}
		}
	}

}