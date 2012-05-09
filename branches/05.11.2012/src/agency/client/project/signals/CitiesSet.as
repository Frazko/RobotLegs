package agency.client.project.signals {
	import agency.client.project.model.vo.CitiesVO;
	import org.osflash.signals.Signal;

	/**
	 * @author alejandromurillo
	 */
	public class CitiesSet extends Signal {
		public function CitiesSet() {
			super(CitiesVO);
		}
	}
}
