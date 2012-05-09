package utils{
import flash.events.Event;
                                  
public class CustomEvent extends flash.events.Event {
	
   // public static const APP_STATUS:String = "ready"; 
   // public static const APP_STATUS:String = "fallen	"; 
  // public static const PHOTOS_LOADED:String = "photosLoaded";
  
	public var arg:*;
	public var isError:Boolean = false;

	

	public function CustomEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, ... a:*) {
 		super(type, bubbles, cancelable);
		arg = a;   
	}     
	// Override clone
	override public function clone():Event{
		return new CustomEvent(type, bubbles, cancelable, arg);
	};
}
}