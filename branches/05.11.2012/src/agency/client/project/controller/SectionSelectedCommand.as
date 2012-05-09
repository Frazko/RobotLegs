package agency.client.project.controller {
	import agency.client.project.model.vo.SectionVO;
	import agency.client.project.model.AppModel;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author acollingtemp
	 */
	public class SectionSelectedCommand extends Command {
		
		[Inject]
		public var appModel:AppModel;
		[Inject]
		public var vo:SectionVO;
		
		override public function execute() : void {
			
			appModel.currentSection = vo;	
			
		}
	}
}
