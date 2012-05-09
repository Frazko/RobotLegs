package agency.client.project.controller {
	import agency.client.project.model.constants.ApplictionConstants;
	import agency.client.project.services.AssetService;
	import org.robotlegs.mvcs.SignalCommand;


	/**
	 * @author acollingtemp
	 */
	public class StartupCompleteCommand extends SignalCommand {
		[Inject]
		public var assetService:AssetService;
		
		
		
		override public function execute() : void {
			assetService.load(ApplictionConstants.XML_PATH);
		}
		
		
	}
}
