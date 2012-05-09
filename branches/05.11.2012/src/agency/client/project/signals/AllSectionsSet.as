package agency.client.project.signals {
	import agency.client.project.model.vo.AllSectionsVO;
	import org.osflash.signals.Signal;

	/**
	 * @author franciscomurillo
	 */
	public class AllSectionsSet extends Signal {
		public function AllSectionsSet() {
			super(AllSectionsVO);
		}
	}
}
