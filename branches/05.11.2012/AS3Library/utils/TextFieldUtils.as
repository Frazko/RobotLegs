package utils {
	import flash.text.AntiAliasType;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	/**
	 * @author acolling
	 */
	public class TextFieldUtils {
		public function TextFieldUtils() {
			trace("my tf constructed-------");
		}

		public static function createTextField(multi : Boolean = false, selectable : Boolean = false, width : uint = 100, height : uint = 50, styleSheet : StyleSheet = null) : TextField {
			var textField : TextField = new TextField();
			textField.styleSheet = styleSheet;
			textField.embedFonts = true;
			textField.multiline = multi;
			textField.wordWrap = multi;
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.width = width;
			textField.height = height;
			textField.selectable = selectable;
			textField.mouseWheelEnabled = false;
			textField.antiAliasType = AntiAliasType.ADVANCED;
			return textField;
		}

		public static function createTextFormat(fontName : String, fontColor : Number, fontSize : uint, letterSpacing : int = 0, bold : Boolean = false, leading : int = 0) : TextFormat {
			var textFormat : TextFormat = new TextFormat(fontName, fontSize, fontColor, bold, null, null, null, null, null, null, null, null, leading);
			textFormat.letterSpacing = letterSpacing;
			return textFormat;
		}
	}
}
