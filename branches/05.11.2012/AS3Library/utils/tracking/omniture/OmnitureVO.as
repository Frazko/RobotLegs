package utils.tracking.omniture
{
	public class OmnitureVO
	{
		public static const TYPE_CUSTOM_LINK:String = 'o';
		public static const TYPE_FILE_DOWNLOAD:String = 'd';
		public static const TYPE_EXIT_LINK:String = 'e';
		
		//Section (always care)		DUV+MUV
		public var channel:String = "vehicles";
		public var subSection : String = "vehicles:electricvehicles";
		public var subSubSection:String = "vehicles:electricvehicles:leaf";
		public var modelRange:String = "electricvehicles";
		public var modelName:String = "leaf";
		public var contentType:String = "product";
		
		public var props:Array = new Array();
		
		//prop[9]  && evar[9]
		//s.prop21 = ie
		//evar[5] = ie
		public var evars:Array = new Array();
		

		// for track
		public var pageURL:String;
		public var referrer:String;
		public var purchaseID:String;
		public var transactionID:String;
		public var server:String;
		public var pageType:String;
		public var visitorID:String;
		public var variableProvider:String;
		public var campaign:String;
		public var state:String;
		public var zip:String;
		public var events:Array = new Array();
		public var products:Array = new Array();
		public var heirs:Array = new Array ();
		
		// for trackLink
		public var type:String;
		public var linkName:String;
		public var linkURL:String;
		public var linkWindow : String;
		public var pageName : String;

		public function OmnitureVO( __pageName : String)  {
			
			pageName = __pageName;
			props[4] = subSection;
			props[5] = subSubSection;
			props[7] = modelName;
			props[8] = modelRange;
			props[9] = contentType;
			props[21] = "ie";
			
			evars[5] = "ie";
			evars[7] = modelRange;
			evars[9] = contentType;
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}