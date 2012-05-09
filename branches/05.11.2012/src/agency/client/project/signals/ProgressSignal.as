package agency.client.project.signals {
	import agency.client.project.model.vo.ProgressVO;

	import org.osflash.signals.Signal;

	/**
	 * @author acolling
	 */
	public class ProgressSignal extends Signal {
		public function ProgressSignal() {
			super(ProgressVO);
		}
		
	}
}
