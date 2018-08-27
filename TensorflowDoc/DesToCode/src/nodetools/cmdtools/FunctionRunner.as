package nodetools.cmdtools 
{
	import laya.utils.Handler;
	/**
	 * ...
	 * @author ww
	 */
	public class FunctionRunner 
	{
		
		public function FunctionRunner() 
		{
			nextFun = _next["bind"](this);
			reset();
		}
		public function reset():void
		{
			runs = [];
		}
		private var runs:Array;
		private var nextFun:Function;
		public function addFun(_this:*, fun:Function, params:Array=null, tip:String=null):void
		{
			var runO:Object;
			runO = { };
			runO._this = _this;
			runO.fun = fun;
			runO.params = params;
			runO.tip = tip;
			runs.push(runO);
		}
		public var complete:Handler;
		public function run():void
		{
			_next();
		}
		private function _next():void
		{
			if (runs.length < 1)
			{
				if (complete) complete.run();
				return;
			}
			var funO:Object;
			funO = runs.shift();
			if (funO.tip)
			{
				trace(funO.tip);
			}
			var param:Array;
			if (!funO.params)
			{
				param = [nextFun];
			}else
			{
				
				param = [];
				param = param.concat(funO.params);
				param.push(nextFun);
			}
			funO.fun.apply(funO._this, param);
		}
	}

}