package agency.client.project.view.mediators {
	import agency.client.project.model.vo.CityVO;
	import agency.client.project.signals.WheaterSet;
	import agency.client.project.view.components.WheaterView;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author alejandromurillo
	 */
	public class WheaterViewMediator extends Mediator {
		[Inject]
		public var view : WheaterView;
		[Inject]
		public var wheaterSet:WheaterSet;
		
		override public function onRegister() : void {
			wheaterSet.add(onWheaterSet);
			
		}

		private function onWheaterSet(vo:CityVO) : void {
			trace("onWheaterSet " + vo.conditions.condition);
			view.update(vo);
		}
		
		
		override public function onRemove() : void {
			wheaterSet.remove(onWheaterSet);
		}
	}
}
