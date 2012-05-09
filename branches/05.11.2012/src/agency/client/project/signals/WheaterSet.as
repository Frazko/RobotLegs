package agency.client.project.signals {
	import agency.client.project.model.vo.CityVO;

	import org.osflash.signals.Signal;

	/**
	 * @author alejandromurillo
	 */
	public class WheaterSet extends Signal {
		public function WheaterSet() {
			super(CityVO);
		}
	}
}
