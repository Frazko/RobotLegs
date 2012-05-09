package agency.client.project.view.components {
	import agency.client.project.model.constants.ApplicationConstants;
	import agency.client.project.model.vo.CityVO;

	import org.osflash.signals.Signal;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author acollingtemp
	 */
	public class NavView extends Sprite {
		public static const BUTTON_HEIGTH : Number = 50;
		private static const SPACER : uint = 20;
		private static const BUTTON_START_Y : uint = 10;
		public var clicked : Signal;
		private var spacer : Number = 25;

		public function NavView() {
			clicked = new Signal();
			(stage) ? initView() : addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		}

		private function onAddedToStage(e : Event) : void {
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			initView();
		}

		private function initView() : void {
		}

		public function createButton(vo : CityVO, _x : Number, _y : Number) : void {
			var _button : CustomButton = new CustomButton(vo);
			_button.x = _x;
			_button.y = _y;
			// _button.height = BUTTON_HEIGTH;
			_button.addEventListener(MouseEvent.CLICK, onClick);
			addChild(_button);
		}

		private function onClick(event : MouseEvent) : void {
			clicked.dispatch((event.target as CustomButton).vo as CityVO);
			trace("@@@@@@@@@@@@@ONCLICKKKKKKKK")
		}

		public function createNav(vo : Array) : void {
			for (var i : int = 0; i < vo.length; i++) {
				var city : CityVO = vo[i] as CityVO;
				createButton(city, ApplicationConstants.BUTTON_HEIGHT, i * (BUTTON_START_Y + spacer));
			}
		}
	}
}
