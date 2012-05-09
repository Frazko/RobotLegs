package agency.client.project.controller {
	import agency.client.project.model.vo.CityVO;
	import agency.client.project.services.WheaterService;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author alejandromurillo
	 */
	public class CitySelectedCommand extends Command {
		
		[Inject]
		public var weatherService:WheaterService;
		[Inject]
		public var vo:CityVO;
		
		
		
		override public function execute() : void {
			//trace("CitySelectedCommand execute IDsss"+id);
			
			weatherService.SearchCityWheater(vo);
			
			trace("CitySelectedCommand end" + vo.id);
		}
	}
}
