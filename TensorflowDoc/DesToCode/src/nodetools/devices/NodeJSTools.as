package nodetools.devices 
{
	import laya.utils.Browser;
	/**
	 * ...
	 * @author ww
	 */
	public class NodeJSTools 
	{
		
		public function NodeJSTools() 
		{
			
		}
		public static function require(str:String):*
		{
			__JS__("return require(str);");
		}
		public static function getArgv():Array
		{
			var argv:*;
			__JS__("argv = process.argv;");
			trace("argv:", argv);
			return argv;
		}
		public static function parseArgToObj(args:Array, start:int = 0, target:Object=null):void
		{
			var i:int, len:int;
			len = args.length;
			var tParam:String;
			var pArr:Array;
			for (i = start; i < len; i++) {
				tParam = args[i];
				if (tParam.indexOf("=") > 0) {
					pArr = tParam.split("=");
					if (target[pArr[0]] && typeof(target[pArr[0]]) == "number")
					{
						 pArr[1] = Sys.mParseFloat( pArr[1]);
					}
					trace(pArr);
					target[pArr[0]] = pArr[1];
				}
			}
		}
		
		public static function parseParamFileToObj(paramFile:String, target:Object):void
		{
			if (!paramFile) return;
			if (FileTools.exist(paramFile))
			{
				try
				{
					var paramO:Object;
					paramO = FileManager.readJSONFile(paramFile);
					if (paramO)
					{
						var tKey:String;
						for (tKey in paramO)
						{
							target[tKey] = paramO[tKey];
						}
					}
				}catch (e:*)
				{
					
				}
			}else
			{
				
			}
		}
		
		public static function getMyPath():String
		{
			return __JS__("__dirname");
		}
		
		public static function getPathByRelatviePath(rPath:String):String
		{
			return FileManager.getPath(getMyPath(), rPath);
		}
		
		public static function eval(codeStr:String):*
		{
			return __JS__("eval(codeStr)");
		}
		
		public static function init():void
		{
			Device.Buffer = __JS__("Buffer");
			SystemSetting.isCMDVer = true;
			OSInfo.init();
			Browser.userAgent = OSInfo.type;
			//初始化文件系统
			FileTools.init2();
			CMDShell.init();
			CMDShell.childProcess = Device.requireRemote("child_process");
		}
	}

}