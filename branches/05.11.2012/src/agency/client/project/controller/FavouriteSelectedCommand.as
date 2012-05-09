package agency.client.project.controller {
	import agency.client.project.model.vo.FavouritesVO;
	import agency.client.project.model.AppModel;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author franciscomurillo
	 */
	public class FavouriteSelectedCommand extends Command {
		[Inject]
		public var appModel:AppModel;
	
		
		override public function execute() : void {
			trace("appmodel " +  appModel.currentImage.bitmap);
			var favouriteVO:FavouritesVO = new FavouritesVO();
			 favouriteVO.section = appModel.currentSection;
			 favouriteVO.image = appModel.currentImage;
			 appModel.setFavouriteImage = favouriteVO;
		}
	}
}
