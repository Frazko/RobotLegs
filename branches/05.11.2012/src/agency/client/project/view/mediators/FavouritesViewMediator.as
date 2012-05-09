package agency.client.project.view.mediators {
	import agency.client.project.signals.FavoriteSelected;
	import agency.client.project.model.vo.FavouritesVO;
	import agency.client.project.signals.FavouriteImageSet;
	import agency.client.project.view.components.FavouritesView;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author franciscomurillo
	 */
	public class FavouritesViewMediator extends Mediator {
		[Inject]
		public var view:FavouritesView;
		
		
		[Inject]
		public var favouriteImageSet:FavouriteImageSet;
		
		
		
		override public function onRegister() : void {
			//favouriteImageSet.add(onFavouriteImageSet);
		}
		
		
		override public function onRemove() : void {
			favouriteImageSet.remove(onFavouriteImageSet);
		}

		private function onFavouriteImageSet(vo:FavouritesVO) : void {
			trace("onFavouriteImageSet " + vo.image);
			view.addFavourite(vo);
		}
	}
}
