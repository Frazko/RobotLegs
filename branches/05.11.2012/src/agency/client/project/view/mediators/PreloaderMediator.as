package agency.client.project.view.mediators {
	import agency.client.project.model.vo.ProgressVO;
	import agency.client.project.signals.CompleteLoad;
	import agency.client.project.signals.ProgressSignal;
	import agency.client.project.view.components.PreloaderView;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author acolling
	 */
	public class PreloaderMediator extends Mediator {
		[Inject]
		public var view : PreloaderView;
		[Inject]
		public var progressSignal : ProgressSignal;
		[Inject]
		public var loadingComplete :CompleteLoad;

		override public function onRegister() : void {
			trace("PreloaderMediator.onRegister()  ");
			progressSignal.add(onProgress);
			loadingComplete.add(onLoadingComplete);
		}

		override public function onRemove() : void {
			trace("PreloaderMediator.onRegister()  ");
			loadingComplete.remove(onLoadingComplete);
			progressSignal.remove(onProgress);
		}

		private function onLoadingComplete() : void {
			trace("onLoadingComplete");
			view.hide();
		}

		private function onProgress(vo : ProgressVO) : void {
			view.showProgress(vo.progress);
		}
	}
}
