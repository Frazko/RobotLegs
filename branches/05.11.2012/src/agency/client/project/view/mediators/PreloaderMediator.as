package agency.client.project.view.mediators {
	import org.robotlegs.mvcs.Mediator;
	import agency.client.project.model.vo.ProgressVO;
	import agency.client.project.signals.LoadingComplete;
	import agency.client.project.signals.ProgressSignal;
	import agency.client.project.view.components.PreloaderView;

	/**
	 * @author acolling
	 */
	public class PreloaderMediator extends Mediator {
		[Inject]
		public var view : PreloaderView;
		[Inject]
		public var progressSignal : ProgressSignal;
		[Inject]
		public var loadingComplete : LoadingComplete;

		override public function onRegister() : void {
			trace("PreloaderMediator.onRegister()  ");
			loadingComplete.add(onLoadingComplete);
			progressSignal.add(onProgress);
		}

		override public function onRemove() : void {
			trace("PreloaderMediator.onRegister()  ");
			loadingComplete.remove(onLoadingComplete);
			progressSignal.remove(onProgress);
		}

		private function onLoadingComplete() : void {
			view.hide();
		}

		private function onProgress(vo : ProgressVO) : void {
			view.showProgress(vo.progress);
		}
	}
}
