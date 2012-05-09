package agency.client.project.model {
	import agency.client.project.model.vo.AllSectionsVO;
	import agency.client.project.model.vo.FavouritesVO;
	import agency.client.project.model.vo.ImageVO;
	import agency.client.project.model.vo.SectionVO;
	import agency.client.project.model.vo.WeatherVO;
	import agency.client.project.signals.AllSectionsSet;
	import agency.client.project.signals.CitiesSet;
	import agency.client.project.signals.FavouriteImageSet;
	import agency.client.project.signals.NewImageSelected;
	import agency.client.project.signals.SectionSet;
	import agency.client.project.signals.WeatherSet;

	import org.robotlegs.mvcs.Actor;

	/**
	 * model.AppModel
	 *
	 * @author YourName
	 */
	public class AppModel extends Actor {
		[Inject]
		public var sectionSet : SectionSet;
		[Inject]
		public var newWeatherSet : WeatherSet;
		[Inject]
		public var newImageSelected : NewImageSelected;
		[Inject]
		public var allSectionsSet : AllSectionsSet;
		[Inject]
		public var favouriteImageSet : FavouriteImageSet;
		
		[Inject]
		public var citiesSet : CitiesSet;
		
		private var _currentSection : SectionVO;
		private var _allSections : AllSectionsVO;
		private var _currentImage : ImageVO;
		public var imageIndex:uint = 0;
		public var _favouritesImages : Array;
		public var _allCities : Array;
		private var _weatherSet : WeatherVO;

		public function AppModel() : void {
			_favouritesImages = new Array();
		}

		public function get currentSection() : SectionVO {
			return _currentSection;
		}

		public function set currentSection(currentSection : SectionVO) : void {
			_currentSection = currentSection;
			currentImage = _currentSection.images[0];
			sectionSet.dispatch(_currentSection);
		}

		public function get currentImage() : ImageVO {
			return _currentImage;
		}

		public function set currentImage(currentImage : ImageVO) : void {
			_currentImage = currentImage;
			newImageSelected.dispatch(_currentImage);
		}

		public function set allSections(value : AllSectionsVO) : void {
			_allSections = value;
			allSectionsSet.dispatch(_allSections);
		}

		public function get allSections() : AllSectionsVO {
			return _allSections;
		}

		public function set setFavouriteImage(favouritesImages : FavouritesVO) : void {
			_favouritesImages.push(favouritesImages);
			favouriteImageSet.dispatch(favouritesImages);
		}

		public function get allCities() : Array {
			return _allCities;
		}

		public function set allCities(allCities : Array) : void {
		    trace("appmodel::allCities:: ");
			_allCities = allCities;
			citiesSet.dispatch(_allCities);
		}

		public function get weatherSet() : WeatherVO {
			return _weatherSet;
		}

		public function set weatherSet(weatherSet : WeatherVO) : void {
			_weatherSet = weatherSet;
			
			newWeatherSet.dispatch(_weatherSet);
		}
	}
}