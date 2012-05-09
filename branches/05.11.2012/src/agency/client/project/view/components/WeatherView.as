package agency.client.project.view.components {
	import agency.client.project.model.vo.WeatherVO;
	import agency.client.project.model.constants.ApplicationConstants;
	import agency.client.project.model.vo.ImageVO;
	import agency.client.project.model.vo.SectionVO;

	import utils.TextFieldUtils;

	import org.osflash.signals.Signal;

	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class WeatherView extends Sprite {
		private static const MARGING_LEFT : Number = 200;
		private static const MARGING_TOP : Number = 50;
		private static const TF_WIDTH : Number = 300;
		private var _textTitle : TextField;
		private var _textBody : TextField;
		private var _format : TextFormat;
		private var _sectionVO : SectionVO;
		private var _imageHolder : Sprite;
		private var _button : CustomButton;
		private var _fButton : CustomButton;
		public var clicked : Signal;
		public var favouriteSelected : Signal;
		private var _imageIndexSet : int;
		private var _currentImage : int;
		private var _imageVO : ImageVO;
		private var _weatherVO : WeatherVO;

		public function WeatherView() {
			clicked = new Signal();
			favouriteSelected = new Signal();
			initDisplay();
		}

		private function initDisplay() : void {
			trace("initDisplay!!!!");

			// Title
			_textTitle = TextFieldUtils.createTextField();
			_textTitle.defaultTextFormat = TextFieldUtils.createTextFormat("Verdana", 0x000000, 14);
			_textTitle.x = MARGING_LEFT;
			_textTitle.y = MARGING_TOP;
			addChild(_textTitle);

			// Body

			_textBody = TextFieldUtils.createTextField();
			_textBody.defaultTextFormat = TextFieldUtils.createTextFormat("Verdana", 0x000000, 14);
			_textBody.x = MARGING_LEFT;
			_textBody.y = MARGING_TOP + 50;
			addChild(_textBody);

			// ImageHolder
			_imageHolder = new Sprite();
			_imageHolder.x = MARGING_LEFT;
			_imageHolder.y = MARGING_TOP + 100;

			addChild(_imageHolder);

		}

		private function init() : void {
			_textTitle.text = weatherVO.location;
			_textBody.text = weatherVO.condition + "  Temp:" + weatherVO.temp;
			_update();
			_imageHolder.addChild(weatherVO.bmp);
		}

		private function _update() : void {
			// _currentImage = 0;

			if (weatherVO.bmp) {
				while (_imageHolder.numChildren > 0) {
					_imageHolder.removeChildAt(0);
				}

				// _imageHolder.addChild(_imageVO.bitmap as Bitmap);
			}
		}



		public function get weatherVO() : WeatherVO {
			return _weatherVO;
		}

		public function set weatherVO(weatherVO : WeatherVO) : void {
			_weatherVO = weatherVO;
			init();
		}
	}
}
