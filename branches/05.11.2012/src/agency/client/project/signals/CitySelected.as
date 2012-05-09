package agency.client.project.signals {
	import agency.client.project.model.vo.CityVO;
	import org.osflash.signals.Signal;

	/**
	 * @author alejandromurillo
	 */
	public class CitySelected extends Signal {
		public function CitySelected() {
			super(CityVO);
		}
	}
}
