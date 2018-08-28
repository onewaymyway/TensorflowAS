package code 
{
	import nodetools.devices.FileManager;
	import nodetools.devices.NodeJSTools;
	/**
	 * ...
	 * @author ww
	 */
	public class ClassCreater 
	{
		private static var clzTpl:String;
		private static var methodTpl:String;
		public static var exportPath:String;
		public function ClassCreater() 
		{
			
		}
		
		public static function init():void
		{
			clzTpl = FileManager.readTxtFile(NodeJSTools.getPathByRelatviePath("data/tpl/clz.tpl"));
			methodTpl = FileManager.readTxtFile(NodeJSTools.getPathByRelatviePath("data/tpl/method.tpl"));
			exportPath = NodeJSTools.getPathByRelatviePath("out/clz");
		}
		public static function createClassO(funO:Object):void
		{
			var funNameFull:String;
			funNameFull = funO.name;
			
			var nameArr:Array;
			nameArr = funNameFull.split(".");
			
			var importDic:Object;
			importDic = { };
			var dataO:Object;
			dataO = { };
			dataO.name = nameArr.pop();
			dataO.doc = "";
			dataO.imports = "";
			dataO["extends"] = "";
			
			var packageStr:String;
			var filePath:String;
			if (nameArr.length > 0)
			{
				packageStr = nameArr.join(".");
				filePath = FileManager.getPath(exportPath, nameArr.join("/"));
			}else
			{
				packageStr = "";
				filePath = exportPath;
			}
			
			var extendsClz:String;
			extendsClz = funO["extends"];
			if (extendsClz)
			{
				
				if (ClassManager.hasClass(extendsClz))
				{
					dataO["extends"] = "extends " + ClassManager.getShorClass(extendsClz);
					importDic[ClassManager.getFullPath(extendsClz)] = extendsClz;
				}
			}
			
			dataO["package"] = packageStr;
			
			dataO.methods = createMethods(funO.method,importDic);
			
			dataO.imports=CodeCreateTool.createImportStr(importDic);
			filePath = FileManager.getPath(filePath, dataO.name + ".as");
			
			var codeStr:String;
			codeStr = CodeCreateTool.createExportCode(clzTpl, dataO);
			FileManager.createTxtFile(filePath, codeStr);
		}
		
		private static function createMethods(funList:Array,importDic:Object=null):String
		{
			if (!funList || funList.length == 0) return "";
			var i:int, len:int;;
			len = funList.length;
			var funStrs:Array;
			funStrs = [];
			for (i = 0; i < len; i++)
			{
				funStrs.push(FunctionCreater.createFunO(funList[i],false,methodTpl,importDic));
			}
			var rst:String;
			rst = funStrs.join("\n");
			rst = CodeCreateTool.addPreToStr(rst, "	");
			return rst;
		}
	}

}