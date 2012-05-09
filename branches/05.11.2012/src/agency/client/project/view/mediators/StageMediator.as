package agency.client.project.view.mediators {
	import org.robotlegs.mvcs.Mediator;
	import agency.client.project.signals.LoadingComplete;
	import agency.client.project.Main;

	/**
	 * @author acolling
	 */
	public class StageMediator extends Mediator {

		[Inject]
		public var view:Main;	
		[Inject]
		public var loadingComplete:LoadingComplete;

		override public function onRegister() : void {
			trace("StageMediator.onRegister()  ");
			loadingComplete.add(onLoadingComplete); 
		}
		
		
		override public function onRemove() : void {
			loadingComplete.remove(onLoadingComplete); 
		}

		private function onLoadingComplete() : void {
			view.addImage();
		}

		

	}
}
