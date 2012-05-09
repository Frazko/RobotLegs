package agency.client.project.view.mediators {
	import agency.client.project.signals.WheaterSet;
	import agency.client.project.model.vo.CityVO;
	import agency.client.project.signals.CitySelected;
	import agency.client.project.model.vo.CitiesVO;
	import agency.client.project.signals.CitiesSet;
	import agency.client.project.model.vo.SectionVO;
	import agency.client.project.signals.SectionSelected;
	import agency.client.project.view.components.NavView;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author acollingtemp
	 */
	public class NavViewMediator extends Mediator {
		
		[Inject]
		public var view:NavView;
		[Inject]
		public var sectionSelected:SectionSelected;
		[Inject]
		public var citiesSet:CitiesSet;
		[Inject]
		public var citySelected:CitySelected;
		[Inject]
		public var wheaterSet:WheaterSet;

		override public function onRegister() : void {
			view.clicked.add(onNavClicked);
			citiesSet.add(onAllCitiesSet);
				
		}

		private function onAllCitiesSet(vo:CitiesVO) : void {
			view.setCities(vo);	
		}
		
		override public function onRemove() : void {
			view.clicked.remove(onNavClicked);	
		}

		private function onNavClicked(vo:CityVO) : void {
			if(vo.conditions == null){
			 trace("info not loaded making request");
			 citySelected.dispatch(vo);
			}else{
				trace("alex else info already loaded");
				wheaterSet.dispatch(vo);
		    }
			
		}

	}
}
