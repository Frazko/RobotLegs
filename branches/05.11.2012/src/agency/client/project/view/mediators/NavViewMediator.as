package agency.client.project.view.mediators {
	import agency.client.project.model.vo.CityVO;
	import agency.client.project.model.vo.SectionVO;
	import agency.client.project.signals.AllSectionsSet;
	import agency.client.project.signals.CitiesSet;
	import agency.client.project.signals.CitySelected;
	import agency.client.project.view.components.NavView;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author acollingtemp
	 */
	public class NavViewMediator extends Mediator {
		
		[Inject]
		public var view:NavView;
		
		[Inject]
		public var citySelected:CitySelected;
		
		[Inject]
		public var allSectionsSet:AllSectionsSet;
		
		[Inject]
		public var citiesSet:CitiesSet;
		
		override public function onRegister() : void {
				citiesSet.add(onAllCitiesLoaded);
				view.clicked.add(onMenuClicked);
		}

		private function onMenuClicked(vo:CityVO) : void {
			citySelected.dispatch(vo);
		}
		
		override public function onRemove() : void {
				citiesSet.remove(onAllCitiesLoaded);
				view.clicked.remove(onMenuClicked);
		}


		private function onAllCitiesLoaded(vo:Array) : void {
			trace(" +++++++++++++++++++++++++   buttonIndex:  "+vo.title);
			trace(" +++++++++++++++++++  ESTA LLEGANDO LA FIESTA:::: ");
			//view.setText(vo.title);	
			view.createNav(vo);
		
			
			
		}
		
		

	}
}
