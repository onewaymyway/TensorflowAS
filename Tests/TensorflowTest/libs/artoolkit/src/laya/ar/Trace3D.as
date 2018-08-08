package laya.ar 
{
	import laya.d3.core.Transform3D;
	import laya.d3.math.Quaternion;
	import laya.d3.math.Vector3;
	/**
	 * ...
	 * @author ww
	 */
	public class Trace3D 
	{
		
		public function Trace3D() 
		{
			
		}
		public static function differTransform3d(transA:Transform3D, transB:Transform3D):void
		{
			var rst:Array;
			rst = [];

			rst.push("position:",Vector3.distance(transA.position, transB.position));
			//rst.push("position:", differVector3D(transA.position, transB.position).join(" "));
			//rst.push("scale:", differVector3D(transA.scale, transB.scale).join(" "));
			rst.push("rotation:", differQuater(transA.rotation, transB.rotation).join(" "));
			//rst.push("localRotationEuler:", differVector3D(transA.localRotationEuler, transB.localRotationEuler).join(" "));
			trace(rst.join("\n"));
		}
		
		public static function differVector3D(vA:Vector3, vB:Vector3):Array
		{
			return differKeys(vA, vB, ["x","y","z"]);
		}
		public static function differQuater(qA:Quaternion, qB:Quaternion):Array
		{
			return differKeys(qA, qB, ["x","y","z","w"]);
		}
		public static function differKeys(oA:*, oB:*,keys:Array):Array
		{
			var i:int, len:int;
			len = keys.length;
			var rst:Array;
			rst = [];
			for (i = 0; i < len; i++)
			{
				var key:String;
				key = keys[i];
				rst.push(key+":"+(oA[key] - oB[key]));
			}
			return rst;
		}
	}

}