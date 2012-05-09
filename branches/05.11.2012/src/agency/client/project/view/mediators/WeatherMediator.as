package agency.client.project.view.mediators {
	import agency.client.project.model.vo.WeatherVO;
	import agency.client.project.signals.NewImageSelected;
	import agency.client.project.signals.WeatherSet;
	import agency.client.project.view.components.WeatherView;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author acollingtemp
	 */
	public class WeatherMediator extends Mediator {
		[Inject]
		public var view : WeatherView;
		
		[Inject]
		public var weatherSet : WeatherSet;
		
		
		
//		[Inject]
//		public var imageSet : ImageSet;
		
//		[Inject]
//		public var favouriteSelected : FavoriteSelected;
		
		[Inject]
		public var newImageSelected : NewImageSelected;

		override public function onRegister() : void {
			weatherSet.add(onWeatherSet);
//			//imageSet.add(onImageSet);
//			newImageSelected.add(onNewImageSelected);
//			view.clicked.add(onArrowClicked);
//			view.favouriteSelected.add(onFavouriteSelected);
			
		}

		private function onFavouriteSelected() : void {
			//favouriteSelected.dispatch();
		}

		override public function onRemove() : void {
			weatherSet.remove(onWeatherSet);
			//newImageSelected.remove(onNewImageSelected);
			//imageSet.remove(onImageSet);
		}

		private function onWeatherSet(vo : WeatherVO) : void {
			view.weatherVO = vo;
		}

//		private function onNewImageSelected(vo:ImageVO) : void {
//			view.imageVO = vo ;
//		}

		private function onArrowClicked(index : int) : void {
			trace("TitleMediator::imageIndex:  " + index);
			
			//imageSet.dispatch(index);
		}

//		private function onImageSet(index : int) : void {
//			trace("TitleMediator:: onImageSet")
//			view.imageIndexSet = index;
//		}
	}
}
