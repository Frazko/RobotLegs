package agency.client.project.controller {
	import agency.client.project.model.AppModel;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author franciscomurillo
	 */
	public class ImageSelectedCommand extends Command {
		[Inject]
		public var appModel:AppModel;
		[Inject]
		public var indexChange:int;
		
		override public function execute() : void {
			
			trace("execute ImageSelectedCommand.... ");
			appModel.imageIndex += indexChange;
			var totalImages:uint = appModel.currentSection.images.length;
			if (appModel.imageIndex>totalImages-1) {
				appModel.imageIndex = 0;
			}
			appModel.currentImage = appModel.currentSection.images[appModel.imageIndex];
			
		}
	}
}
