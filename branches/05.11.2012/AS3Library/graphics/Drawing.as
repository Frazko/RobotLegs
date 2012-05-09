package graphics {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;

	/**
	 * @author acolling
	 */
	public class Drawing {
		private static function magicTrigFunctionX(pointRatio : Number) : Number {
			return Math.cos(pointRatio * 2 * Math.PI);
		}

		private static function magicTrigFunctionY(pointRatio : Number) : Number {
			return Math.sin(pointRatio * 2 * Math.PI);
		}

		public static function drawTriangle(p1 : Point, p2 : Point, p3 : Point, joinUp : Boolean, lineCol : int,  thick:uint=1, fillCol: int = 0x0, fillAlpha : Number = 0) : Shape {
			var s:Shape = new Shape();
			if (joinUp) s.graphics.beginFill(fillCol, fillAlpha);
			s.graphics.lineStyle(thick,lineCol);
			s.graphics.moveTo(p1.x, p1.y);
			s.graphics.lineTo(p2.x, p2.y);
		 	s.graphics.lineTo(p3.x, p3.y);
			if (joinUp){
				s.graphics.lineTo(p1.x, p1.y);
				s.graphics.endFill();
			}
			return s;
		}


		//
		public static function cookieCut (objectToShow:DisplayObject, objectToCutOut:DisplayObject):Bitmap
		{
			var container:Sprite = new Sprite ();

			var objectToShowBMD:BitmapData = new BitmapData (objectToShow.width, objectToShow.height, true, 0x00000000);
			objectToShowBMD.draw (objectToShow);

			var objectToShowBitmap:Bitmap = new Bitmap (objectToShowBMD);
			objectToShowBitmap.x = objectToShow.x;
			objectToShowBitmap.y = objectToShow.y;
			container.addChild (objectToShowBitmap);

			var objectToCutOutBMD:BitmapData = new BitmapData (objectToCutOut.width, objectToCutOut.height, true, 0x00000000);
			objectToCutOutBMD.draw (objectToCutOut);

			var objectToCutOutBitmap:Bitmap = new Bitmap (objectToCutOutBMD);
			objectToCutOutBitmap.x = objectToCutOut.x;
			objectToCutOutBitmap.y = objectToCutOut.y;
			container.addChild (objectToCutOutBitmap);

			var finalBMD:BitmapData = new BitmapData (container.width, container.height, true, 0x00000000);
			finalBMD.draw (container);
			finalBMD.floodFill (objectToCutOut.x+(objectToCutOut.width*.5), objectToCutOut.y+(objectToCutOut.height*.5), 0x00000000);

			var finalBitmap:Bitmap = new Bitmap (finalBMD);

			return finalBitmap;
		}
		public static function getCirclePoints(radius : Number, sides : uint, centerX : Number = 0, centerY : Number = 0) : Array {
			var retA : Array = [];
			for (var i : uint = 0; i <= sides; i++) {
				var pointRatio : Number = i / sides;
				var xSteps : Number = magicTrigFunctionX(pointRatio);
				var ySteps : Number = magicTrigFunctionY(pointRatio);
				var pointX : Number = centerX + xSteps * radius;
				var pointY : Number = centerY + ySteps * radius;
				var point : Point = new Point(pointX, pointY);
				retA.push(point);
			}
			return retA;
		}

		public static function center(target : DisplayObject, parent : DisplayObject) : void {
			target.x = (parent.width / 2) - (target.width / 2) + parent.x
			target.y = (parent.height / 2) - (target.height / 2) + parent.y;
		}

		public static function drawBox(w : int, h : int, fillColor : int, fillAlpha : Number = 1, lineThick : uint = 0, lineCol : int = 0x0, lineAlph : Number = 0) : Shape {
			// todo add option to add as a border (deduct line size from box size)
			var shape : Shape = new Shape();
			shape.graphics.lineStyle(lineThick, lineCol, lineAlph);
			shape.graphics.beginFill(fillColor, fillAlpha);
			shape.graphics.drawRect(0, 0, w, h);
			return shape;
		}

		public static function drawArc(drawObj : Sprite, centerPoint : Point, radius : Number, startAngle : Number, arcAngle : Number, steps : int) : void {
			var twoPI : Number = 2 * Math.PI;
			var angleStep : Number = arcAngle / steps;
			var xx : Number = centerPoint.x + Math.cos(startAngle * twoPI) * radius;
			var yy : Number = centerPoint.y + Math.sin(startAngle * twoPI) * radius;
			var angle : Number;

			drawObj.graphics.moveTo(xx, yy);

			for (var i : uint = 1; i <= steps; i++) {
				angle = startAngle + i * angleStep;
				xx = centerPoint.x + Math.cos(angle * twoPI) * radius;
				yy = centerPoint.y + Math.sin(angle * twoPI) * radius;
				drawObj.graphics.lineTo(xx, yy);
			}
		}

		public static function drawSolidArc(drawObj : Sprite, centerPoint : Point, innerRadius : Number, outerRadius : Number, startAngle : Number, arcAngle : Number, steps : int = 20) : void {
			//
			// Used to convert angles [ratio] to radians.
			var twoPI : Number = 2 * Math.PI;
			//
			// How much to rotate for each point along the arc.
			var angleStep : Number = arcAngle / steps;
			//
			// Variables set later.
			var angle : Number;
			var i : uint;
			var endAngle : Number;
			//
			// Find the coordinates of the first point on the inner arc.
			var xx : Number = centerPoint.x + Math.cos(startAngle * twoPI) * innerRadius;
			var yy : Number = centerPoint.y + Math.sin(startAngle * twoPI) * innerRadius;
			//
			// Store the coordinates.
			var xxInit : Number = xx;
			var yyInit : Number = yy;
			//
			// Move to the first point on the inner arc.
			drawObj.graphics.moveTo(xx, yy);
			//
			// Draw all of the other points along the inner arc.
			for (i = 1; i <= steps; i++) {
				angle = (startAngle + i * angleStep) * twoPI;
				xx = centerPoint.x + Math.cos(angle) * innerRadius;
				yy = centerPoint.y + Math.sin(angle) * innerRadius;
				drawObj.graphics.lineTo(xx, yy);
			}
			//
			// Determine the ending angle of the arc so you can
			// rotate around the outer arc in the opposite direction.
			endAngle = startAngle + arcAngle;
			//
			// Start drawing all points on the outer arc.
			for (i = 0;i <= steps;i++) {
				//
				// To go the opposite direction, we subtract rather than add.
				angle = (endAngle - i * angleStep) * twoPI;
				xx = centerPoint.x + Math.cos(angle) * outerRadius;
				yy = centerPoint.y + Math.sin(angle) * outerRadius;
				drawObj.graphics.lineTo(xx, yy);
			}
			//
			// Close the shape by drawing a straight
			// line back to the inner arc.
			drawObj.graphics.lineTo(xxInit, yyInit);
		}

		public static function drawCurvedLine(drawObj : Sprite, startPoint : Point, endPoint : Point, controlPoint : Point) : void {
			drawObj.graphics.moveTo(startPoint.x, startPoint.y);
			drawObj.graphics.curveTo(controlPoint.x, controlPoint.y, endPoint.x, endPoint.y);
		}

		public static function drawDashedBox(drawObj : Sprite, x : Number, y : Number, w : Number, h : Number, dash_w : Number = 2, dash_thickness : Number = 1, color : Number = 0x000000) : void {
			var xt : Number = (w / dash_w) * 2;
			var yt : Number = (h / dash_w) * 2;

			var n : Number = xt + yt;

			drawObj.graphics.lineStyle(dash_thickness, color);
			drawObj.graphics.moveTo(x, y);

			var t : Number;
			var r : Number;
			var b : Number;
			var l : Number;
			var side : String;
			var start_x : Number;
			var end_x : Number;
			var start_y : Number;
			var end_y : Number;

			for (var i : int = 0; i <= n; i++) {
				// determine side to draw:
				t = (xt / 2);
				r = t + (yt / 2);
				b = r + (xt / 2);
				l = b + (yt / 2);

				side = (i < t) ? "top" : (i < r) ? "right" : (i < b) ? "bottom" : (i < l) ? "left" : null;
				if (!side) {
					break;
				}

				switch(side) {
					case "top":
						start_x = x + (i * dash_w);
						end_x = start_x + dash_w;
						start_y = y;
						end_y = y;
						break;
					case "right":
						start_x = x + w;
						end_x = x + w;
						start_y = y + ((i - t) * dash_w);
						end_y = start_y + dash_w;
						break;
					case "bottom":
						start_x = (x + w) - ((i - r) * dash_w);
						end_x = start_x - dash_w;
						start_y = y + h;
						end_y = start_y;
						break;
					case "left":
						start_x = x;
						end_x = start_x;
						start_y = (x + h) - ((i - b) * dash_w);
						end_y = start_y - dash_w;
						break;
				}

				if (i % 2 == 0) {
					drawObj.graphics.moveTo(start_x, start_y);
					drawObj.graphics.lineTo(end_x, end_y);
				}
			}
		}

		public static function drawCircle(radius : int, color : int) : Shape {
			var circle : Shape = new Shape();
			circle.graphics.lineStyle(0);
			circle.graphics.beginFill(color);
			circle.graphics.drawCircle(0, 0, radius);
			return circle;
		}

		public static function drawLine(vect : Point, thick : int, col : uint) : Shape {
			var shape : Shape = new Shape();
			shape.graphics.lineStyle(thick, col);
			shape.graphics.lineTo(vect.x, vect.y);
			return shape;
		}
	}
}
