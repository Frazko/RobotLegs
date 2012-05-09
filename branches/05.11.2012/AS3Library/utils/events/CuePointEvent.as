package utils.events {
	import flash.events.Event;

	/**
	 * @author acolling
	 */
	public class CuePointEvent extends Event {
		
		public static const CUE_POINT:String = "cuePoint";
		public var cpType:String;
		public var name:String;
		public var time:Number;
		
		
		public function CuePointEvent(type : String, cpType:String, cpName:String, cpTime:Number) {
			this.cpType = cpType;
			name = cpName;
			time = cpTime;
			super(type, true, true);
		}
	}
}
