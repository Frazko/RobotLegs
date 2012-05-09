package agency.client.project.view.components {
	import agency.client.project.model.vo.CityVO;
	import agency.client.project.model.vo.CitiesVO;
	import org.osflash.signals.Signal;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author acollingtemp
	 */
	public class NavView extends Sprite {
		private static const BUTTON_SPACER : Number = 10;
		private var _button : CustomButton;
		public var clicked : Signal;
		
		
		public function NavView() {
				clicked = new Signal();
			(stage) ? initView() : addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);	
			
		}

		private function onAddedToStage(e:Event) : void {
			
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			initView();
		}

		private function initView() : void {
			
		
			//createButton();
			
		}

		private function createButton() : void {
			
//			_button = new CustomButton();
//			_button.x = 300;
//			_button.y = 20;
//			addChild(_button);
//			_button.addEventListener(MouseEvent.CLICK, onClick);
//			
			
		}

		private function onClick(event : MouseEvent) : void {
			trace("onclick " + (event.target as CustomButton).vo.conditions);
			clicked.dispatch((event.target as CustomButton).vo);
			
		}

		public function setCities(vo : CitiesVO) : void {
			trace("NavView setCities()"+vo.citiesArray.length);
			for (var i : int = 0; i < vo.citiesArray.length; i++) {
				var button:CustomButton = new CustomButton((vo.citiesArray[i] as CityVO));
				addChild(button);
				trace("mamones "+button.height);
				button.y = (button.height + BUTTON_SPACER)*i;
				button.addEventListener(MouseEvent.CLICK, onClick);
			}
			
			
			
		}
		
		
	}
}
