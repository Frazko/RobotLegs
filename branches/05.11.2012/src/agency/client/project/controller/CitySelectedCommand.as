package agency.client.project.controller {
	import agency.client.project.model.AppModel;
	import agency.client.project.model.vo.CityVO;
	import agency.client.project.services.WeatherService;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author acollingtemp
	 */
	public class CitySelectedCommand extends Command {
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var weatherService:WeatherService;
		
		[Inject]
		public var vo:CityVO;
		
		override public function execute() : void {
			weatherService.getWeatherFor(vo.code);
		}
	}
}
