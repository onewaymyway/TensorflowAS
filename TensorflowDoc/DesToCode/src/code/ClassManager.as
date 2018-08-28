package code 
{
	import nodetools.devices.FileManager;
	import nodetools.devices.FileTools;
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
		private static var _failDic:Object = { };
		
		public static function addClzPath(folder:String):void
		{
			if (!FileManager.exists(folder)) return;
			var files:Array;
			files = FileManager.getFileList(folder);
			var i:int, len:int;
			len = files.length;
			var tFile:String;
			var rPath:String;
			var fileName:String;
			for (i = 0; i < len; i++)
			{
				tFile = files[i];
				rPath = FileManager.getRelativePath(folder, tFile);
				fileName = FileTools.getFileName(tFile);
				rPath = rPath.replace(fileName + ".as", fileName);
				rPath = FileManager.adptToCommonUrl(rPath);
				rPath = rPath.split("/").join(".");
				addClz(rPath);
			}
		}
		public static function addClz(clzFullPath:String):void
		{
			_clzDic[getShorClass(clzFullPath)] = clzFullPath;
		}
		
		public static function hasClass(clzPath:String):Boolean
		{
			var p:String;
			p = clzPath;
			clzPath = getShorClass(clzPath);
			if (_clzDic[clzPath])
			{
				return true;
			}
			_failDic[p] = p;
			return false;
		}
		
		public static function traceFailDic():void
		{
			trace("Fails:");
			var key:String;
			for (key in _failDic)
			{
				trace(key);
			}
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
			var short:String;
			short = getShorClass(clz);
			if (hasClass(short)) return _clzDic[short];
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