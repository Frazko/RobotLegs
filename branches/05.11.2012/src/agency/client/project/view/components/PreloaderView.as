package agency.client.project.view.components {
	import com.greensock.TweenMax;

	import org.osflash.signals.Signal;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author acolling
	 */
	public class PreloaderView extends Sprite {
		
		private var _holder : Sprite;
		private var _progressLine : Sprite;
		private var _background : Sprite;
		
		public var preloaderHidden : Signal;

		public function PreloaderView() {
			(stage) ? init() : addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		}

		private function onAddedToStage(event : Event) : void {
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			init();
		}

		private function init() : void {
			
			preloaderHidden = new Signal();
			
			//add holder
			_holder = new Sprite();
			addChild(_holder);

			
			//add background			
			_background = new Sprite();
			_background.graphics.lineStyle(1);
			_background.graphics.beginFill(0xcccccc);
			_background.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			_holder.addChild(_background);
			
			//add progress line
			_progressLine = new Sprite();
			_progressLine.graphics.beginFill(0xff00ff);
			_progressLine.graphics.drawRect(0, stage.stageHeight-100, stage.stageWidth, 100);
			_holder.addChild(_progressLine);
			showProgress(0);
			
		}


		public function showProgress(n : Number) : void {
			trace("PreloaderView.showProgress(n)  :"+n);
			_progressLine.scaleX = n;
		}


		public function hide() : void {
			TweenMax.to(_holder, 3, {autoAlpha:0, onComplete:onHidden});
		}

		private function onHidden() : void {
			preloaderHidden.dispatch();
		}
	}
}
