package utils {
	import org.osflash.signals.Signal;

	/**
	 * @author acolling
	 */
	public class ProgressSignal extends Signal {
		public function ProgressSignal() {
			super(Number);
		}
	}
}
