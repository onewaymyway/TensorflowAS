package code 
{
	import nodetools.devices.FileManager;
	import nodetools.devices.NodeJSTools;
	/**
	 * ...
	 * @author ww
	 */
	public class FunctionCreater 
	{
		
		public function FunctionCreater() 
		{
			
		}
		private static var funTpl:String;
		public static var exportPath:String;
		public static function init():void
		{
			funTpl = FileManager.readTxtFile(NodeJSTools.getPathByRelatviePath("data/tpl/fun.tpl"));
			exportPath = NodeJSTools.getPathByRelatviePath("out/fun");
		}
		
		public static function createFunO(funO:Object,createFile:Boolean=true,tpl:String=null,importDic:Object=null):String
		{
			if (!importDic) importDic = { };
			tpl = tpl || funTpl;
			var funNameFull:String;
			funNameFull = funO.name;
			var params:Array;
			params = funO.params;
			
			var returnStr:String;
			returnStr = funO["return"];
			
			
			var nameArr:Array;
			nameArr = funNameFull.split(".");
			
			var dataO:Object;
			dataO = { };
			dataO.name = nameArr.pop();
			dataO.doc = "";
			dataO.imports = "";
			dataO.returntype = "*";
			dataO["return"] = "";
			dataO.params = createParamStr(params);
			
			if (returnStr && ClassManager.hasClass(returnStr))
			{
				dataO.returntype = ClassManager.getShorClass(returnStr);
				importDic[ClassManager.getFullPath(returnStr)] = returnStr;
				
				dataO["return"] = "null";
			}
			
			dataO.imports = CodeCreateTool.createImportStr(importDic);
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
			
			dataO["package"] = packageStr;
			dataO["doc"] = createDocStr(funO, dataO);
			
			filePath = FileManager.getPath(filePath, dataO.name+".as");
			
			var codeStr:String;
			codeStr = CodeCreateTool.createExportCode(tpl, dataO);
			if(createFile)
			FileManager.createTxtFile(filePath, codeStr);
			return codeStr;
		}
		private static function createDocStr(funO:Object,dataO:Object):void
		{
			var docStrs:Array;
			docStrs = [];
			docStrs.push("	/**");
			docStrs.push("	 * " + dataO.name);
			var params:Array;
			params = funO.params;
			if (params && params.length > 0)
			{
				var i:int, len:int;
				len = params.length;
				var paramO:Object;
				for (i = 0; i < len; i++) {
					paramO = params[i];
					docStrs.push("	 * @param " + paramO.name+" "+paramO.type+" "+paramO.doc);
				}
			}
			

			docStrs.push("	 * @return "+funO["return"]||"");
			
			docStrs.push("	 */");
			return docStrs.join("\n");
		}
		private static function createParamStr(paramList:Array):String
		{
			if (!paramList || paramList.length == 0) return "";
			var i:int, len:int;
			var paramStrs:Array;
			paramStrs = [];
			len = paramList.length;
			var paramO:Object;
			for (i = 0; i < len; i++)
			{
				paramO = paramList[i];
				paramStrs.push(paramO.name+":*=null");
			}
			return paramStrs.join(",");
		}
	}

}