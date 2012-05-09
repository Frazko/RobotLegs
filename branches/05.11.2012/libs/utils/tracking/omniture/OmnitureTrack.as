package utils.tracking.omniture {
	import org.osflash.signals.Signal;

	public class OmnitureTrack extends Signal {
		public function OmnitureTrack() {
			trace("OMNITURE TRACK");			
			super(OmnitureVO);
		}
		
	}
}
