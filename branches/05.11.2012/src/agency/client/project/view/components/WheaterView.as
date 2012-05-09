package agency.client.project.view.components {
	import agency.client.project.model.vo.CityVO;
	import flash.display.Bitmap;
	import flash.text.TextField;

	import utils.TextFieldUtils;

	import agency.client.project.model.vo.WheaterVO;

	import flash.display.Sprite;

	/**
	 * @author alejandromurillo
	 */
	public class WheaterView extends Sprite {
		private var _title : TextField;
		private var _condition : TextField;
		private var _imageContainer : Sprite;
		private var _tempeture : TextField;

		public function WheaterView() {
			_title = TextFieldUtils.createTextField();
			_title.defaultTextFormat = TextFieldUtils.createTextFormat("Verdana", 0x000000, 14);
			_condition = TextFieldUtils.createTextField();
			_condition.defaultTextFormat = TextFieldUtils.createTextFormat("Verdana", 0x000000, 14);
			_tempeture = TextFieldUtils.createTextField();
			_tempeture.defaultTextFormat = TextFieldUtils.createTextFormat("Verdana", 0x000000, 14);
			_imageContainer = new Sprite();
			addChild(_imageContainer);

			addChild(_title);
			addChild(_condition);
			addChild(_tempeture);

			_imageContainer.x = _title.x = _condition.x = _tempeture.x = 200;
			_imageContainer.y = 100;
			_title.y = 5;
			_condition.y = 25;
			_tempeture.y = 50;
		}

		public function update(vo : CityVO) : void {
			_title.text = vo.conditions.title;
			_condition.text = "Condition: " + vo.conditions.condition;
			_tempeture.text = "Temperture: " + vo.conditions.temperature;
			while (_imageContainer.numChildren > 0) {
				_imageContainer.removeChildAt(0);
			}
			_imageContainer.addChild(vo.conditions.image);
		}
	}
}
