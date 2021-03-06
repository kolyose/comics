package controls
{
	import events.ControlsEvent;
	
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class TouchControls extends BaseTouchControls
	{
		protected var _lastTouchedDisplayObject:DisplayObject;
		protected var _bTouchMoved:Boolean;
		protected var _initialTouchLocation:Point;
		protected var _doubleTapTimer:Timer;
		
		public function TouchControls(stage:DisplayObject)
		{
			super(stage);
		}
		
		override public function enable():void
		{
			_stage.addEventListener(TouchEvent.TOUCH, touchHandler);
		}
		
		override public function disable():void
		{
			_stage.removeEventListener(TouchEvent.TOUCH, touchHandler);
		}
		
		protected function touchHandler(event:TouchEvent):void
		{
			var displayObject:DisplayObject = event.target as DisplayObject;
		
			// Just for testing on PC purposes //////////////////////////////////////////
			var touchHover:Touch = event.getTouch(displayObject, TouchPhase.HOVER);
			if (touchHover) return;
			/////////////////////////////////////////////////////////////////////////////
			
			var touchBegan:Touch = event.getTouch(displayObject, TouchPhase.BEGAN);
			var touchStationary:Touch = event.getTouch(displayObject, TouchPhase.STATIONARY);
			var touchMoved:Touch = event.getTouch(displayObject, TouchPhase.MOVED);			
			var touchEnded:Touch = event.getTouch(displayObject, TouchPhase.ENDED);
						
			if (touchBegan)
			{
				_initialTouchLocation = new Point(touchBegan.getLocation(displayObject).x, touchBegan.getLocation(displayObject).y);
			}
			else if (touchStationary)
			{
				
			}
			else if (touchMoved)
			{
				_bTouchMoved = true;
				
				var slideOffset:Point = getTouchOffset(touchMoved, displayObject);
				dispatchEventWith(ControlsEvent.MOVE, false, slideOffset);
			}
			else if (touchEnded)
			{
				if (_bTouchMoved)
				{
					_bTouchMoved = false;
					var slideCompleteOffset:Point = new Point(touchEnded.getLocation(displayObject).x - _initialTouchLocation.x, touchEnded.getLocation(displayObject).y - _initialTouchLocation.y);
					dispatchEventWith(ControlsEvent.MOVE_COMPLETE, false, slideCompleteOffset);
					_initialTouchLocation = new Point(0,0);
				}
				else if ((touchEnded.getLocation(displayObject).x == touchEnded.getPreviousLocation(displayObject).x) && (touchEnded.getLocation(displayObject).y == touchEnded.getPreviousLocation(displayObject).y))
				{
					if (touchEnded.tapCount == 1 && !_doubleTapTimer)
					{
					//	dispatchEventWith(ControlsEvent.TAP, false, _touchedDisplayObject);
					//	return;
						_lastTouchedDisplayObject = displayObject;
						_doubleTapTimer = new Timer(200,1);
						_doubleTapTimer.addEventListener(TimerEvent.TIMER_COMPLETE, timerCompleteHandler);
						_doubleTapTimer.start();
					}
					else
					{
						if (_doubleTapTimer)
						{
							_doubleTapTimer.stop();
							_doubleTapTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, timerCompleteHandler);
							_doubleTapTimer = null;
						}
						
						dispatchEventWith(ControlsEvent.DOUBLE_TAP, false, displayObject);
					}
				}
			}			
		}
		
		protected function timerCompleteHandler(event:TimerEvent):void
		{
			_doubleTapTimer.stop();
			_doubleTapTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, timerCompleteHandler);
			_doubleTapTimer = null;
			
			dispatchEventWith(ControlsEvent.TAP, false, _lastTouchedDisplayObject);
		}
		
		protected function getTouchOffset(touch:Touch, target:DisplayObject):Point
		{
			return new Point(touch.getLocation(target).x - touch.getPreviousLocation(target).x, touch.getLocation(target).y - touch.getPreviousLocation(target).y);			
		}
	}
}