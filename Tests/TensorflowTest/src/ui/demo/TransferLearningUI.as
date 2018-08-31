/**Created by the LayaAirIDE,do not modify.*/
package ui.demo {
	import laya.ui.*;
	import laya.display.*; 

	public class TransferLearningUI extends View {
		public var trainBtn:Button;
		public var playBtn:Button;
		public var leftBtn:Button;
		public var rightBtn:Button;
		public var upBtn:Button;
		public var downBtn:Button;
		public var resultTxt:Label;
		public var dataTxt:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":400,"height":300},"child":[{"type":"Button","props":{"y":159,"x":7,"var":"trainBtn","skin":"comp/button.png","label":"train"}},{"type":"Button","props":{"y":159,"x":135,"var":"playBtn","skin":"comp/button.png","label":"play"}},{"type":"Button","props":{"y":218,"x":209,"width":54,"var":"leftBtn","skin":"comp/button.png","label":"左","height":23}},{"type":"Button","props":{"y":216,"x":324,"width":54,"var":"rightBtn","skin":"comp/button.png","label":"右","height":23}},{"type":"Button","props":{"y":181,"x":265,"width":54,"var":"upBtn","skin":"comp/button.png","label":"上","height":23}},{"type":"Button","props":{"y":256,"x":266,"width":54,"var":"downBtn","skin":"comp/button.png","label":"下","height":23}},{"type":"Label","props":{"y":12,"x":290,"width":99,"var":"resultTxt","text":"state","height":43,"color":"#f62420"}},{"type":"Label","props":{"y":212,"x":9,"width":168,"var":"dataTxt","text":"state","height":71,"color":"#f62420"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}