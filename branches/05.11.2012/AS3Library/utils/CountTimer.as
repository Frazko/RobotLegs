package utils
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	// import org.osflash.signals.Signal;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author ihayes
	 */
	public class CountTimer extends EventDispatcher
	{
		public const COUNT_UPDATE:String = "countUpdate";
		public const COUNT_COMPLETE:String = "countComplete";
		public const TOTAL_COUNT_COMPLETE:String = "totalCountComplete";

		// public var updateSignal:Signal;
		// public var countCompleteSignal:Signal;
		// public var totalCountCompleteSignal:Signal;

		private var _startCountIndex:int;
		private var _targetCountIndex:int;
		private var _currentCountIndex:int;
		private var _timer:Timer;
		private var _loop:Boolean;
		private var _targetLoopIndex:uint;
		private var _countsCompleted:uint;
		private var _countStep:uint;

		public function CountTimer (timerDelay:Number)
		{
			// updateSignal = new Signal (int);
			// countCompleteSignal = new Signal ();
			// totalCountCompleteSignal = new Signal ();

			_timer = new Timer (timerDelay);
			_loop = false;
			_targetLoopIndex = 0;
			_countsCompleted = 0;
		}

		public function get currentCountIndex ():int
		{
			return _currentCountIndex;
		}

		public function get delay ():Number
		{
			return _timer.delay;
		}

		public function set delay (value:Number):void
		{
			_timer.delay = value;
		}

		public function get loop ():Boolean
		{
			return _loop;
		}

		public function setLoop (loop:Boolean, targetLoopIndex:uint = 0):void
		{
			_loop = loop;
			_targetLoopIndex = targetLoopIndex;
		}

		public function get loopCount ():uint
		{
			return _targetLoopIndex;
		}

		public function set loopCount (value:uint):void
		{
			_targetLoopIndex = value;
		}

		public function start (startIndex:int, targetIndex:int, countStep:uint = 1):void
		{
			//if (startIndex == targetIndex) throw new Error ("The start index must be greater than, or less than the target index.");
			if (startIndex == targetIndex)
			{
				dispatchEvent (new Event (TOTAL_COUNT_COMPLETE));
				return;
			}

			_startCountIndex = startIndex;
			_currentCountIndex = startIndex;
			_targetCountIndex = targetIndex;
			_countStep = countStep;
			_countsCompleted = 0;

			_timer.addEventListener (TimerEvent.TIMER, timerHandler);
			_timer.start ();
		}
		
		public function stop ():void
		{
			_timer.reset ();
			if (_timer.hasEventListener (TimerEvent.TIMER)) _timer.removeEventListener (TimerEvent.TIMER, timerHandler);
		}

		public function pause ():void
		{
			if (_timer.running) _timer.stop ();
		}

		public function resume ():void
		{
			if (!_timer.running) _timer.start ();
		}

		public function reset ():void
		{
			_timer.reset ();

			if (_timer.hasEventListener (TimerEvent.TIMER)) _timer.removeEventListener (TimerEvent.TIMER, timerHandler);

			_startCountIndex = 0;
			_currentCountIndex = 0;
			_targetCountIndex = 0;
			_countStep = 1;
			_countsCompleted = 0;
		}

		private function timerHandler (event:TimerEvent):void
		{
			if (_startCountIndex < _targetCountIndex)
			{
				if (_currentCountIndex < _targetCountIndex)
				{
					if ((_currentCountIndex + _countStep) <= _targetCountIndex)
					{
						_currentCountIndex += _countStep;
					}
					else
					{
						_currentCountIndex += (_targetCountIndex - _currentCountIndex);
					}

					// updateSignal.dispatch (_currentIndex);
					dispatchEvent (new Event (COUNT_UPDATE));
				}
				else
				{
					countComplete ();
				}
			}
			else
			{
				if (_currentCountIndex > _targetCountIndex)
				{
					if ((_currentCountIndex - _countStep) >= _targetCountIndex)
					{
						_currentCountIndex -= _countStep;
					}
					else
					{
						_currentCountIndex -= (_currentCountIndex - _targetCountIndex);
					}
					

					// updateSignal.dispatch (_currentIndex);
					dispatchEvent (new Event (COUNT_UPDATE));
				}
				else
				{
					countComplete ();
				}
			}
		}

		private function countComplete ():void
		{
			// countCompleteSignal.dispatch ();
			dispatchEvent (new Event (COUNT_COMPLETE));

			++_countsCompleted;

			if (_loop && _countsCompleted < _targetLoopIndex)
			{
				_currentCountIndex = _startCountIndex;
			}
			else
			{
				// totalCountCompleteSignal.dispatch ();
				dispatchEvent (new Event (TOTAL_COUNT_COMPLETE));

				reset ();
			}
		}
	}
}
