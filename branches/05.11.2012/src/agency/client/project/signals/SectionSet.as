package agency.client.project.signals {
	import agency.client.project.model.vo.SectionVO;
	import org.osflash.signals.Signal;

	/**
	 * @author acollingtemp
	 */
	public class SectionSet extends Signal {
		
		public function SectionSet() {
			super(SectionVO);
		}
		
	}
}
