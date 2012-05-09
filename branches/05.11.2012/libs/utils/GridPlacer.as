package utils {
	import flash.display.Sprite;

	public class GridPlacer extends Sprite {

		public var width:Number;
		public var height:Number
		public var rows:Number
		public var columns:Number;
		public var colWidth:Number;
		public var rowHeight:Number;

		public function GridPlacer(w:Number, h:Number,r:Number, c:Number){
			super();
			width= w;
			height= h;
			rows= r;
			columns = c;
			colWidth= w/columns;
			rowHeight= h/rows;
						test()
			trace("GridPlacer created");
;
			//var t = returnPoint(1)
		}
	
		/*
		//recieves position and returns point
		public function returnPoint(p:Number):Point {
			trace("returnPoint returnPoint returnPoint");
			var retP:Point  = new Point();
			var theX:number = colWidth*(p%rows);
			trace("theX:"+theX);
			var theY:Number = rowHeight*Math.floor((p+1)/(columns+1))
			trace("theY:"+theY);
			return retP;
		}*/
		public function test() {
			trace("test");
		}
	
	
	}


}

