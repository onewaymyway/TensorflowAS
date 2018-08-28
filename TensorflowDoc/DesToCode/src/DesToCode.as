package  
{
	import code.ClassCreater;
	import code.ClassManager;
	import code.FunctionCreater;
	import nodetools.devices.FileManager;
	import nodetools.devices.NodeJSTools;
	/**
	 * ...
	 * @author ww
	 */
	public class DesToCode 
	{
		
		public function DesToCode() 
		{
			init();
			work();
		}
		
		private function init():void
		{
			NodeJSTools.init();
		}
		
		private var outPath:String;
		private function work():void
		{
			var myPath:String;
			myPath = NodeJSTools.getMyPath();
			outPath = FileManager.getPath(myPath, "out/");
			
			FunctionCreater.init();
			ClassCreater.init();
			
			ClassCreater.exportPath = NodeJSTools.getPathByRelatviePath("out/tf/class/src");
			FunctionCreater.exportPath=NodeJSTools.getPathByRelatviePath("out/tf/method/src");
			
			ClassManager.addClz("Promise");
			ClassManager.addClzPath(NodeJSTools.getPathByRelatviePath("out/tf/add/src"));
			var configPath:String;
			configPath = FileManager.getPath(myPath, "data/tensorflowDes.json");
			var configData:Object;
			configData = FileManager.readJSONFile(configPath);
			
			ClassManager.setClassList(configData.classList);
			//trace("configData:", configData);
			createFunctionList(configData.functionList);
			createClassList(configData.classList);
			
			ClassManager.traceFailDic();
		}
		private function createClassList(clsList:Array):void
		{
			var i:int, len:int;
			len = clsList.length;
			for (i = 0; i < len; i++)
			{
				ClassCreater.createClassO(clsList[i]);
			}
		}
		private function createFunctionList(funList:Array):void
		{
			var i:int, len:int;
			len = funList.length;
			for (i = 0; i < len; i++)
			{
				createFunO(funList[i]);
			}
		}
		
		private function createFunO(funO:Object):void
		{
			FunctionCreater.createFunO(funO);
		}
		
	}

}