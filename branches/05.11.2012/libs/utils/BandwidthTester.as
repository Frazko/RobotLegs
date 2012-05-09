package utils {
	import org.osflash.signals.Signal;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	
	[Event(name="complete", type="Event.COMPLETE")]
	[Event(name="progress", type="ProgressEvent.PROGRESS")]
	public class BandwidthTester extends EventDispatcher
	{
		
		private var testFile:String;
		
		private var fileSize:Number;
		
		private var downloader:URLLoader;
		
		private var callback:Function;
		
		private var startTime : Number;
		public var progressUpdate : ProgressSignal;
		
		
		/**
		 * Constructor
		 * testFile - Absolute URL to the file to be downloaded
		 * fileSize - Size of the target file in KB
		 */
		public function BandwidthTester( testFile:String )
		{
			progressUpdate = new ProgressSignal();
			
			this.testFile = testFile;
			
			downloader = new URLLoader();
			
			downloader.addEventListener(Event.COMPLETE,complete);			
			downloader.addEventListener(IOErrorEvent.IO_ERROR,error);
			downloader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,error);
			downloader.addEventListener(ProgressEvent.PROGRESS,progress);
		}
		
		/**
		 * Tests the download speed, and then calls back with the speed in KB/s
		 * Note: This function could take several seconds to get a result
		 * 
		 * Callback signature should be: 
		 * function callback( success:Boolean, message:String, result:Number )
		 */
		public function testSpeed( callback:Function ):void
		{
			this.callback = callback;
					
			var request:URLRequest = new URLRequest( testFile + "?rand="+Math.random() ); // avoid hitting cache
			
			startTime = ( new Date() ).time;
			downloader.load( request );
		}
		
		/**
		 * Download successful
		 * Return average download speed
		 */
		private function complete(e:Event):void
		{
			var finishTime:Number = ( new Date() ).time;
			var total:Number = ( finishTime - startTime ) / 1000; // total seconds
			callback.call( null, true, "success", fileSize/total );
			dispatchEvent( e );
		}
		
		/**
		 * Download failed
		 * Return error
		 */
		private function error(e:Event):void
		{
			callback.call( null, false, e.toString(), -1 );
		}
		
		private function progress(e:ProgressEvent):void
		{
			progressUpdate.dispatch(e.bytesLoaded/e.bytesTotal);
			this.fileSize = e.bytesTotal / 1024; // KB
			dispatchEvent( e );
		}
			
	}
}