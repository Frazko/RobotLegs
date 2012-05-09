package agency.client.project.view.components {
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.display.Sprite;

	/**
	 * @author acollingtemp
	 */
	public class TitleView extends Sprite {
		private var _textField : TextField;
		private var _format : TextFormat;
		public function TitleView() {
			
			initDisplay();
		}

		private function initDisplay() : void {
			
			_textField = new TextField();
			
			addChild(_textField);
			
			_format = new TextFormat();
			
			_format.size = 24;
			_textField.defaultTextFormat = _format;
			
		}

		public function setText(title : String) : void {
			_textField.text = title;
		}
		
		
	}
}
