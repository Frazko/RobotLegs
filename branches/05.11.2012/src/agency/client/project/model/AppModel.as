package agency.client.project.model {
	import flash.trace.Trace;
	import agency.client.project.model.vo.CityVO;
	import agency.client.project.model.vo.CitiesVO;
	import agency.client.project.model.vo.SectionVO;
	import agency.client.project.model.vo.WheaterVO;
	import agency.client.project.signals.CitiesSet;
	import agency.client.project.signals.SectionSet;
	import agency.client.project.signals.WheaterSet;

	import org.robotlegs.mvcs.Actor;

	/**
	 * model.AppModel
	 *
	 * @author YourName
	 */
	public class AppModel extends Actor {
		
		[Inject]
		public var sectionSet:SectionSet;
		[Inject]
		public var citiesSet:CitiesSet;
		[Inject]
		public var wheaterSet:WheaterSet;
		
		private var _currentSection : SectionVO;
		
		private var _citiesVo : CitiesVO;
		
		private var _cityVo : CityVO;
		
		
		public function AppModel() : void {
		}

		public function get currentSection() : SectionVO {
			return _currentSection;
		}

		public function set currentSection(currentSection : SectionVO) : void {
			_currentSection = currentSection;
			sectionSet.dispatch(_currentSection);
		}

		public function get citiesVo() : CitiesVO {
			return _citiesVo;
		}

		public function set citiesVo(citiesVo : CitiesVO) : void {
			_citiesVo = citiesVo;
			citiesSet.dispatch(_citiesVo);
			
		}

		public function get cityVo() : CityVO {
			return _cityVo;
		}

		public function set cityVo(cityVo : CityVO) : void {
			_cityVo = cityVo;
			wheaterSet.dispatch(_cityVo);
			trace("cityVo " + cityVo.conditions.temperature);
		}
		
		
	}
}