package agency.client.project.signals {
	import agency.client.project.model.vo.ImageVO;
	import org.osflash.signals.Signal;

	/**
	 * @author franciscomurillo
	 */
	public class NewImageSelected extends Signal {
		public function NewImageSelected() {
			super(ImageVO);
		}
	}
}
