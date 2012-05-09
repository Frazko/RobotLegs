package graphics {
	import flash.geom.Point;
	import flash.display.DisplayObject;

	/**
	 * @author acolling
	 */
	public class Drawing {
		
		
		private static function magicTrigFunctionX(pointRatio : Number):Number {
			return Math.cos(pointRatio * 2 * Math.PI);
		}

		private static function magicTrigFunctionY(pointRatio : Number):Number {
			return Math.sin(pointRatio * 2 * Math.PI);
		}

		//
		public static function getCirclePoints(radius : Number, sides : uint,centerX : Number=0, centerY : Number = 0) : Array {
			var retA : Array = [];
			for (var i:uint = 0; i <= sides; i++) {
				var pointRatio:Number = i / sides;
				var xSteps:Number  = magicTrigFunctionX(pointRatio);
				var ySteps:Number  = magicTrigFunctionY(pointRatio);
				var pointX:Number  = centerX + xSteps * radius;
				var pointY:Number  = centerY + ySteps * radius;
				var point:Point = new Point(pointX, pointY);
				retA.push(point);
			}
			return retA;
		}
		
		public static function center( target:DisplayObject, parent:DisplayObject):void{
			
			target.x = (parent.width/2)-(target.width/2)+parent.x
			target.y = (parent.height/2)-(target.height/2)+parent.y;
			
		}
		
		public static function drawArc(drawObj:Sprite, centerPoint:Point, radius:Number, startAngle:Number, arcAngle:Number, steps:int) : void
				{
				    var twoPI : Number = 2 * Math.PI;
				    var angleStep : Number = arcAngle/steps;
				    var xx : Number = centerPoint.x + Math.cos(startAngle * twoPI) * radius;
				    var yy : Number = centerPoint.y + Math.sin(startAngle * twoPI) * radius;
					var angle : Number;

				    drawObj.graphics.moveTo(xx, yy);

				    for(var i:uint=1; i<=steps; i++){
				        angle = startAngle + i * angleStep;
				        xx = centerPoint.x + Math.cos(angle * twoPI) * radius;
				        yy = centerPoint.y + Math.sin(angle * twoPI) * radius;
				        drawObj.graphics.lineTo(xx, yy);
				    }
				}


				public static function drawSolidArc (drawObj:Sprite, centerPoint:Point, innerRadius:Number, outerRadius:Number, startAngle:Number, arcAngle:Number, steps:int=20) : void 
				{
				    //
				    // Used to convert angles [ratio] to radians.
				    var twoPI : Number = 2 * Math.PI;
				    //
				    // How much to rotate for each point along the arc.
				    var angleStep : Number = arcAngle/steps;
				    //
				    // Variables set later.
				    var angle : Number;
					var i: uint;
					var endAngle : Number;
				    //
				    // Find the coordinates of the first point on the inner arc.
				    var xx : Number = centerPoint.x + Math.cos(startAngle * twoPI) * innerRadius;
				    var yy : Number = centerPoint.y + Math.sin(startAngle * twoPI) * innerRadius;
				    //
				    //Store the coordinates.
				    var xxInit : Number = xx;
				    var yyInit : Number = yy;
				    //
				    // Move to the first point on the inner arc.
				    drawObj.graphics.moveTo(xx,yy);
				    //
				    // Draw all of the other points along the inner arc.
				    for(i=1; i<=steps; i++) {
				        angle = (startAngle + i * angleStep) * twoPI;
				        xx = centerPoint.x + Math.cos(angle) * innerRadius;
				        yy = centerPoint.y + Math.sin(angle) * innerRadius;
				        drawObj.graphics.lineTo(xx,yy);
				    }
				    //
				    // Determine the ending angle of the arc so you can
				    // rotate around the outer arc in the opposite direction.
				    endAngle = startAngle + arcAngle;
				    //
				    // Start drawing all points on the outer arc.
				    for(i=0;i<=steps;i++) {
				        //
				        // To go the opposite direction, we subtract rather than add.
				        angle = (endAngle - i * angleStep) * twoPI;
				        xx = centerPoint.x + Math.cos(angle) * outerRadius;
				        yy = centerPoint.y + Math.sin(angle) * outerRadius;
				        drawObj.graphics.lineTo(xx,yy);
				    }
				    //
				    // Close the shape by drawing a straight
				    // line back to the inner arc.
				    drawObj.graphics.lineTo(xxInit,yyInit);
				}


				public static function drawCurvedLine( drawObj:Sprite, startPoint:Point, endPoint:Point, controlPoint:Point ) : void
				{
					drawObj.graphics.moveTo( startPoint.x, startPoint.y );
					drawObj.graphics.curveTo( controlPoint.x, controlPoint.y, endPoint.x, endPoint.y );

				}

				public static function drawDashedBox( drawObj:Sprite, x:Number, y:Number, w:Number, h:Number, dash_w:Number=2, dash_thickness:Number=1, color:Number=0x000000 ) : void
				{

				    var xt : Number  = (w / dash_w) * 2;
				    var yt : Number  = (h / dash_w) * 2;

				    var n : Number = xt + yt;

					drawObj.graphics.lineStyle(dash_thickness, color );
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

				    for (var i:int = 0; i<=n; i++) {
				        //determine side to draw:
				        t = (xt/2);
				        r = t + (yt/2);
				        b = r + (xt/2);
				        l = b + (yt/2);

				        side = (i<t) ? "top" :
				                        (i<r) ? "right" :
				                        (i<b) ? "bottom" :
				                        (i<l) ? "left" :
				                        null;
				        if (!side) { break; }


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
				                start_y = y + ((i-t) * dash_w);
				                end_y = start_y + dash_w;
				                break;
				            case "bottom":
				                start_x = (x + w) - ((i-r) * dash_w);
				                end_x = start_x - dash_w;
				                start_y = y + h;
				                end_y = start_y;
				                break;
				            case "left":
				                start_x = x;
				                end_x = start_x;
				                start_y = (x + h) - ((i-b) * dash_w);
				                end_y = start_y - dash_w;
				                break;
				        }

				        if (i % 2 == 0) {
				        	drawObj.graphics.moveTo(start_x, start_y);
				        	drawObj.graphics.lineTo(end_x, end_y);
				        }
				    }

				}
	}
}
