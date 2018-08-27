package laya.utils 
{
	import laya.display.Sprite;
	import laya.events.Event;
	/**
	 * staticCache刷新工具类
	 */
	public class RecacheTool 
	{
		
		public function RecacheTool() 
		{
			
		}
		private var _target:Sprite;
		public var focusDeltaFrame:int = 2;
		public var unFocusDeltaFrame:int = 20;
		public function set target(v:Sprite):void
		{
			_clearTarget();	
			_target = v;
			if (!v) return;
			_initTarget();
			onMouseOut();
		}
		private function _clearTarget():void
		{
			if (!_target) return;
			_target.off(Event.MOUSE_OVER, this, onMouseOver);
			_target.off(Event.MOUSE_OUT, this, onMouseOut);
		}
		private function _initTarget():void
		{
			//return;
			_target.on(Event.MOUSE_OVER, this, onMouseOver);
			_target.on(Event.MOUSE_OUT, this, onMouseOut);
		}
		private function onMouseOver():void
		{
			Laya.timer.frameLoop(focusDeltaFrame, this, updateLoop);
		}
		
		private function onMouseOut():void
		{
			Laya.timer.frameLoop(unFocusDeltaFrame, this, updateLoop);
		}
		
		private function updateLoop():void
		{
			if (!_target)
			{
				Laya.timer.clear(this, updateLoop);
				return;
			}
			_target.reCacheWait();
		}
	}

}