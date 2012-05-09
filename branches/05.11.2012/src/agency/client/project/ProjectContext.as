package agency.client.project {
	import agency.client.project.controller.CitySelectedCommand;
	import agency.client.project.controller.StartupCompleteCommand;
	import agency.client.project.model.AppModel;
	import agency.client.project.services.AssetService;
	import agency.client.project.services.WeatherService;
	import agency.client.project.signals.AllSectionsSet;
	import agency.client.project.signals.CitiesSet;
	import agency.client.project.signals.CitySelected;
	import agency.client.project.signals.FavouriteImageSet;
	import agency.client.project.signals.LoadingComplete;
	import agency.client.project.signals.NewImageSelected;
	import agency.client.project.signals.ProgressSignal;
	import agency.client.project.signals.SectionSet;
	import agency.client.project.signals.WeatherSet;
	import agency.client.project.signals.WeatherSignal;
	import agency.client.project.view.components.NavView;
	import agency.client.project.view.components.PreloaderView;
	import agency.client.project.view.components.WeatherView;
	import agency.client.project.view.mediators.NavViewMediator;
	import agency.client.project.view.mediators.PreloaderMediator;
	import agency.client.project.view.mediators.StageMediator;
	import agency.client.project.view.mediators.WeatherMediator;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalContext;


	public class ProjectContext extends SignalContext {

		public function ProjectContext(contextView : Main = null, autoStartup : Boolean = true) {
			super(contextView, autoStartup);
		}

		override public function startup() : void {
			trace("Context.startup()  ");
			mapController();
			mapSignals();
			mapModel();
			mapService();
			mapView();
			super.startup();;
		}

		private function mapController() : void {
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCompleteCommand);
			
			//TODO add commands here
			signalCommandMap.mapSignalClass(CitySelected, CitySelectedCommand);
			
		}

		private function mapView() : void {
			mediatorMap.mapView(WeatherView, WeatherMediator);
			mediatorMap.mapView(PreloaderView, PreloaderMediator);
			mediatorMap.mapView(NavView, NavViewMediator);
			mediatorMap.mapView(Main, StageMediator);
		}
		
		private function mapSignals():void {
			injector.mapSingleton(ProgressSignal);
			injector.mapSingleton(LoadingComplete);
			injector.mapSingleton(AllSectionsSet);
			injector.mapSingleton(SectionSet);
			injector.mapSingleton(NewImageSelected);
			injector.mapSingleton(FavouriteImageSet);
			injector.mapSingleton(CitiesSet);
			injector.mapSingleton(WeatherSet);
			injector.mapSingleton(WeatherSignal);
		}

		private function mapModel() : void {
			injector.mapSingleton(AppModel);
		}
		
		private function mapService() : void {
			injector.mapSingleton(WeatherService);
			injector.mapSingleton(AssetService);
			
		}

		

		
	}
}
