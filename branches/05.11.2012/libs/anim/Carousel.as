package anim {
	import com.greensock.easing.Linear;
	import flash.display.DisplayObject;
	import com.greensock.TweenMax;
	import com.greensock.easing.Cubic;
	import com.greensock.plugins.*;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	

	public class Carousel extends Sprite {
		private var _positions : Array;
		private var _circWidth : uint = 300;
		private var _circHeight : uint = 200;
		private var _minScale : Number = .6;
		private var _holder : Sprite;
		private var _currentPos : uint;
		private var _moveAmt : int;
		private var _items : Array;
		private var orderArr : Array;
		private var labSp : Sprite;
	
		//array of points
		public function Carousel( displayObjects:Array, positions:Array ) {
			_items = displayObjects;
			_positions = positions;//array of objects with properties could be extended to more than x and y later
			TweenPlugin.activate([BezierThroughPlugin, BezierPlugin]);
			init();
		}

		public function get currentPos() : uint {
			return _currentPos;
		}

		public function set currentPos(value : uint) : void {
			_currentPos = value;
		}

		private function init() : void {
//			_positions = [];
//			_positions.push({name:0, x:_circWidth / 2, y:_circHeight, scaleX:1, scaleY:1});
//			// front
//			_positions.push({name:1, x:_circWidth, y:_circHeight / 2, scaleX:_minScale + ((1 - _minScale) / 2), scaleY:_minScale + ((1 - _minScale) / 2)});
//			// front left
//			_positions.push({name:2, x:_circWidth - (_circWidth / 3), y:0, scaleX:_minScale, scaleY:_minScale});
//			// back right
//			_positions.push({name:3, x:_circWidth / 3, y:0, scaleX:_minScale, scaleY:_minScale});
//			// back left
//			_positions.push({name:4, x:0, y:_circHeight / 2, scaleY:_minScale + ((1 - _minScale) / 2), scaleX:_minScale + ((1 - _minScale) / 2)});
//			// front right
			draw();
		}

		private function draw() : void {
			orderArr = new Array();
			_holder = new Sprite();
			addChild(_holder);

			_holder.x = 100;
			_holder.y = 100;


			for (var i : uint = 0; i < _positions.length; i++) {
				
				//initialises the positions of each item
			
				var ob : Object = _positions[i];

				var myS : DisplayObject = _items[i] as DisplayObject;
				myS.x = ob.x;
				myS.y = ob.y;

			}
			currentPos = 0;
			var myA : Array = [0, 1, 2, 3, 4, 5, 6, 7];
			
			trace(returnNextPositions(myA, 6, -2));
			// should be 456
		}

		private function showLabel(e : MouseEvent) : void {
			e.currentTarget.label.visible = true;
		}

		private function hideLabel(e : MouseEvent) : void {
			e.currentTarget.label.visible = false;
		}

		private function drawLabel() : void {
		}

		private function getDirectionToMove(clickedS : int) : int {
			
			//return
			var tmpret:int = _positions.length - clickedS;
			return tmpret;
			
			
			var retI : int = currentPos - clickedS;

			if (retI < -2) {
				retI = _positions.length + retI;
			}

			if (retI > 2) {
				retI = _positions.length - retI;
			}

			return retI;
		}

		public function clicked(disp : DisplayObject) : void {
			// figure out which way to move
			var clickedItem : int = _items.indexOf(disp);
	
			_moveAmt = getDirectionToMove(clickedItem);
			// _moveAmt = newPos - _currentPos;

			trace("move amount:" + _moveAmt);
			currentPos = clickedItem;
			moveItems(_moveAmt);
		}

		private function moveItems(moveAmt : int) : void {
			for (var i : uint = 0; i < _positions.length; i++) {
				var myS : Sprite = _items[i];
				// _holder.getChildAt(i) as Sprite;//_holder.getChildByName("s"+i.toString()) as Sprite;
				var points : Array = returnNextPositions(_positions, i, _moveAmt);
				if (i == 1) {
					trace("next positions:" + points.toString());
					for (var j : uint = 0; j < points.length; j++) {
						var obj : Object = points[j];
						var mySt : String = "";
						for (var s:String in obj) {
							mySt += s + " >>:" + obj[s] + "\r";
						}
						trace("Properties:" + mySt);
					}
				}
				(i == 0) ? tweenItem(myS, points) : tweenItem(myS, points, true);
				// tweenItem(myS, [_positions[0]]);
			}
		}

		//
		private function resetItems() : void {
			// readd listener

			for (var p : Number = 0; p < orderArr.length;p++) {
				orderArr[p].addEventListener(MouseEvent.CLICK, clicked)
			}

			trace("reset items, current is:" + currentPos);
			// create an array of the children in order
			var a : Array = [];
			a = _items;
			// re=reorder the array making the new index 0
			var newPositions : Array = a.slice(currentPos, a.length).concat(a.slice(0, currentPos));
			// current pos is 2 remove all children from holder and then start adding from myS2
			_items = newPositions;
			/*while(_holder.numChildren>0){
			_holder.removeChildAt(0);
			}
			var tmp:Array = [];
			for (var k:uint = 0; k<_positions.length; k++){
				
			_holder.addChild(newPositions[k]);
			tmp.push(a[k]);
			}*/
			currentPos = 0;
		}

		private function tweenItem(s : Sprite, points : Array, complete : Boolean = false) : void {
			s.removeEventListener(MouseEvent.CLICK, clicked);
			var dur : Number = 1.4;
			(complete) ? TweenMax.to(s, dur, {bezierThrough:points, ease:Linear.easeNone, orientToBezier:false}) : TweenMax.to(s, dur, {bezierThrough:points, orientToBezier:false, ease:Cubic.easeOut, onComplete:resetItems, onUpdate:checkDepth})
		}

		private function checkDepth() : void {
			orderArr.sortOn("y", Array.NUMERIC);
			var cnt : int = 0;
			for (var p : Number = 0; p < orderArr.length; p++) {
				// remember the circles are children of the holder
				_holder.setChildIndex(orderArr[p], p)
				orderArr[p].label.filters = null;
				if ((orderArr[p].y > 170)) {
					getBlurFilter(orderArr[p], "out")
				} else if ((orderArr[p].y < 150)) {
					getBlurFilter(orderArr[p], "weak")
				}
				;
			}
		}

		private function getBlurFilter(o : Sprite, type : String) : void {
			var blurred : BlurFilter = new BlurFilter(3, 3, 3);
			var storedBlur : Array = [blurred];
			// var blurred2 : BlurFilter = new BlurFilter(5, 5, 5);
			// var storedBlur2 : Array = [blurred2];
			switch (type) {
				case 'weak':
					//o.filters = storedBlur;
					break;
				case 'hard':
					// o.filters = storedBlur2;
					break;
				case 'out':
					o.filters = null;
					break;
			}
		}

		
		private function returnNextPositions(arr : Array, curr : uint, diff : int) : Array {
			// splice the array then rejoin
			var a : Array = arr.slice(curr + 1, arr.length).concat(arr.slice(0, curr));
			if (diff < 0) a.reverse();
			// flip if negative
			a.splice(Math.abs(diff), a.length - Math.abs(diff));
			return a;
		}
	}
}