package utils.tracking.omniture {
	import org.robotlegs.mvcs.SignalCommand;
	
	public class OmnitureTrackCommand extends SignalCommand {
		[Inject]
		public var omniture : Omniture;
		[Inject]
		public var omnitureVO : OmnitureVO;

		override public function execute() : void {
			trace("tracking omniture command.......");
			omniture.track(omnitureVO);
		}
	}
}
