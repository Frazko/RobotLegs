package agency.client.project.view.components {
	import agency.client.project.model.constants.ApplicationConstants;
	import agency.client.project.model.vo.CityVO;

	import utils.TextFieldUtils;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;

	/**
	 * @author acollingtemp
	 */
	public class CustomButton extends Sprite {
		private var _bg : Shape;
		public var vo : CityVO;
		private var _title : TextField;

		public function CustomButton(VO : CityVO = null) {
			vo = VO;
			initDisplay();
			setButtonMode();
		}

		private function initDisplay() : void {
			_bg = new Shape();
			_bg.graphics.beginFill(0xffff00);
			_bg.graphics.drawRect(0, 0, ApplicationConstants.BUTTON_WIDTH, ApplicationConstants.BUTTON_HEIGHT);
			addChild(_bg);

			_title = TextFieldUtils.createTextField();
			_title.defaultTextFormat = TextFieldUtils.createTextFormat("Verdana", 0x000000, 14);
			_title.text = vo.id;
			addChild(_title);
		}

		private function setButtonMode() : void {
			useHandCursor = true;
			buttonMode = true;
			mouseChildren = false;
		}
	}
}
