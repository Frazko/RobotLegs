package agency.client.project.view.components {
	import agency.client.project.model.vo.CityVO;

	import flash.display.Sprite;
	import flash.text.TextField;

	/**
	 * @author acollingtemp
	 */
	public class CustomButton extends Sprite {
		private var _bg : Sprite;
		private var _txt : TextField;
		public var vo : CityVO;

		public function CustomButton(pvo : CityVO) {
			vo = pvo;
			initDisplay();
			setButtonMode();
			
		}

		private function initDisplay() : void {
			_bg = new Sprite();
			_bg.graphics.beginFill(0xffff00);
			_bg.graphics.drawRect(0, 0, 70, 20);
			
			_txt = new TextField();
			_bg.addChild(_txt);
			_txt.text = vo.name;
			_txt.height = 20;
			_txt.width = 70;
			addChild(_bg);
		}

		private function setButtonMode() : void {
			useHandCursor = true;
			buttonMode = true;
			mouseChildren = false;
		}

		
	}
}
