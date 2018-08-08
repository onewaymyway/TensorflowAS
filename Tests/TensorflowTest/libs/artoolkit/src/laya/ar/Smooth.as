package laya.ar 
{
	import laya.d3.math.Matrix4x4;
	/**
	 * ...
	 * @author ww
	 */
	public class Smooth 
	{
		private var _mtList:Array = [];
		private var _mt:Matrix4x4 = new Matrix4x4();
		private var smoothRate:Number = 0;
		public function Smooth() 
		{
			
		}
		public function updateMt(mt:Matrix4x4):void
		{
			var i:int, len:int;
			var preValues:Array;
			var newValues:Array;
			newValues = mt.elements;
			preValues = _mt.elements;
			len = newValues.length;
			for (i = 0; i < len; i++)
			{
				preValues[i] = preValues[i] * smoothRate + newValues[i] * (1-smoothRate);
			}
		}
		public function resetMt(mt:Matrix4x4):void
		{
			_mt.elements.set(mt);
		}
		public function get mat():Matrix4x4
		{
			return _mt;
		}
	}

}