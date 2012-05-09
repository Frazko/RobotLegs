package utils {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	public class Utils {
		public static function ranRange(minNum : Number, maxNum : Number) : Number {
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}

		public static function getURL(url : String, window : String = null) : void {
			var req : URLRequest = new URLRequest(url);
			trace("getURL", url);
			try {
				navigateToURL(req, window);
			} catch (e : Error) {
				trace("Navigate to URL failed", e.message);
			}
		}

		public static function makeButton(m : Sprite) : void {
			m.buttonMode = true;
			m.useHandCursor = true;
			m.mouseChildren = false;
		}
		
		public static function stripHTML(value : String) : String {
				return value.replace(/<.*?>/g, "");
		}

		public static function getArrayFromDisplay(holder : Sprite) : Array {
			var a:Array = [];
			for (var i : int = 0; i < holder.numChildren; i++) {
				a.push(holder.getChildAt(i));
			}
			return a;
		}
		
		public static function getDomain(s:String):String{
			
			var firstSlash:uint = s.indexOf("/");
			var thirdSlash:int = s.indexOf("/", firstSlash+2);
			return s.substring(0, thirdSlash);
			
		}

		public static function unmakeButton(interactiveSprite : Sprite) : void {
			interactiveSprite.buttonMode = false;
			interactiveSprite.useHandCursor = false;
			interactiveSprite.mouseChildren = true;
		}
		
	}
}