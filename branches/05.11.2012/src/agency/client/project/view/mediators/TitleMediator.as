package agency.client.project.view.mediators {
	import agency.client.project.model.vo.SectionVO;
	import agency.client.project.signals.SectionSet;
	import agency.client.project.view.components.TitleView;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author acollingtemp
	 */
	public class TitleMediator extends Mediator {
		
		[Inject]
		public var view:TitleView;
		[Inject]
		public var sectionSet:SectionSet;
		
		override public function onRegister() : void {
				sectionSet.add(onSectionSet)
		}	

		
		
		override public function onRemove() : void {
				sectionSet.remove(onSectionSet);
			
		}


		private function onSectionSet(vo:SectionVO) : void {
			
			view.setText(vo.title);	
			
		}
		
		
	}
}
