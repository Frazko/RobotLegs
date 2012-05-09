package agency.client.project {
	import agency.client.project.view.components.FavouritesView;
	import agency.client.project.view.components.WeatherView;
	import com.greensock.TweenLite;
	import agency.client.project.view.components.NavView;
	import com.greensock.loading.XMLLoader;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.display.Bitmap;

	import com.greensock.loading.LoaderMax;

	import agency.client.project.view.components.PreloaderView;

	import com.greensock.plugins.AutoAlphaPlugin;
	import com.greensock.plugins.TweenPlugin;

	import flash.display.Sprite;
	import flash.events.Event;

	[SWF(width="1000", height="800", frameRate="30", backgroundColor="#ffffff")]
	public class Main extends Sprite {
		private var _context : ProjectContext;

		public function Main() {
			(stage) ? initApp() : addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		}

		private function onAddedToStage(event : Event) : void {
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			initApp();
		}

		private function initApp() : void {
			
			stage.align = StageAlign.TOP_LEFT;
		 	stage.scaleMode = StageScaleMode.NO_SCALE;
			
			// force fonts to be imported
			MyFonts;

			// initialise auto alpha
			TweenPlugin.activate([AutoAlphaPlugin]);

			// create robotlegs context but don't autostart
			_context = new ProjectContext(this);
			addPreloader();
			addNav();
			addTitle();
			addFavouritesView();

			// startup robotlegs
		}

		private function addTitle() : void {
			addChild(new WeatherView());
		}
		
		private function addFavouritesView() : void {
			addChild(new FavouritesView());
		}

		private function addNav() : void {
			addChild(new NavView());
			
		}

		private function addPreloader() : void {
			addChild(new PreloaderView());
		}

		public function destroy() : void {
			
			// TODO implement destroy where necessary
		}

		// example function to show how to get an image
		public function addImage() : void {
			/*
			var loader:XMLLoader = LoaderMax.getLoader("main");
			
			var image1 : Bitmap = LoaderMax.getLoader("dogs1").rawContent;
			image1.x = 50;
			image1.y = 100;
			image1.alpha = 0;
			addChild(image1);
			var image2 : Bitmap = LoaderMax.getLoader("dogs2").rawContent;
			image2.x = 500;
			image2.y = 200;
			image2.alpha = 0;
			addChild(image2);
			TweenLite.to(image1, 1, {alpha:1, delay:1});
			TweenLite.to(image2, 1, {alpha:1, delay:1.5});
			 * 
			 * 
			 */
		}
	}
}
