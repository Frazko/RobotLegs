package agency.client.project.signals {
	import agency.client.project.model.vo.FavouritesVO;
	import org.osflash.signals.Signal;

	/**
	 * @author franciscomurillo
	 */
	public class FavouriteImageSet extends Signal {
		public function FavouriteImageSet() {
			super(FavouritesVO);
		}
	}
}
