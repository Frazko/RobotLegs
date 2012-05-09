package agency.client.project.view.components {
	import flash.display.Bitmap;
	import agency.client.project.model.vo.FavouritesVO;
	import flash.display.Sprite;

	/**
	 * @author franciscomurillo
	 */
	public class FavouritesView extends Sprite {
		private var _container:Sprite;
		public function FavouritesView() {
			initDisplay();
		}

		private function initDisplay() : void {
			_container = new Sprite();
			addChild(_container);
			
		}

		public function addFavourite(vo : FavouritesVO) : void {
			trace("estan volando addFavourite " + vo.image.bitmap);
			var imageThumb:Sprite = new Sprite();
			_container.addChild(imageThumb);
			var image:Bitmap = new Bitmap(vo.image.bitmap.bitmapData);
			imageThumb.addChild(image);
			imageThumb.scaleX = imageThumb.scaleY = 0.1; 
			_container.x = 900;
			_container.y = 100;
			
		}
	}
}
