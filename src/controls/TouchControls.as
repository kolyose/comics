package controls
{
	import events.ControlsEvent;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class TouchControls extends EventDispatcher implements IControls
	{
		protected var _stage:DisplayObject;
		protected var _lastTouchedDisplayObject:DisplayObject;
		protected var _bTouchMoved:Boolean;
		protected var _initialTouchLocationX:Number;
		protected var _doubleTapTimer:Timer;
		
		public function TouchControls(stage:DisplayObject)
		{
			_stage = stage;			
			
			super();
		}
		
		public function enable():void
		{
			_stage.addEventListener(TouchEvent.TOUCH, touchHandler);
		}
		
		public function disable():void
		{
			_stage.removeEventListener(TouchEvent.TOUCH, touchHandler);
		}
		
		public function init():void
		{			
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
				_initialTouchLocationX = touchBegan.getLocation(displayObject).x;
			}
			else if (touchStationary)
			{
				
			}
			else if (touchMoved)
			{
				_bTouchMoved = true;
				
				var xOffset:Number = getTouchOffsetX(touchMoved, displayObject);//touchMoved.getLocation(displayObject).x - touchMoved.getPreviousLocation(displayObject).x;				
				dispatchEventWith(ControlsEvent.SLIDE, false, xOffset);
			}
			else if (touchEnded)
			{
				if (_bTouchMoved)
				{
					_bTouchMoved = false;
					dispatchEventWith(ControlsEvent.SLIDE_COMPLETE, false, touchEnded.getLocation(displayObject).x - _initialTouchLocationX);
					_initialTouchLocationX=0;
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
		
		protected function getTouchOffsetX(touch:Touch, target:DisplayObject):Number
		{
			return touch.getLocation(target).x - touch.getPreviousLocation(target).x;			
		}
	}
}