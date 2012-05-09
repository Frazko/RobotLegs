package utils.events {
	import flash.events.Event;

	/**
	 * @author acolling
	 */
	public class MetaDataEvent extends Event {
		
		public static const META_DATA_EVENT : String = "metaDataEvent";
		public var duration : Number;
		public var width : Number;
		public var height : Number;
		public var framerate : Number;
		public var bitrate:Number;
		
		public function MetaDataEvent(type : String, obj:Object)  {
			
			duration = obj.duration;
			width = obj.width;
			height = obj.height;
			framerate = obj.framerate;
			bitrate = obj.videodatarate;
			
			super(type, true, true);
		}
	}
}
