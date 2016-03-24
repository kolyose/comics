package controls
{
	import events.ControlsEvent;
	
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
		
		protected var _bTouchMoved:Boolean;
		protected var _initialTouchLocationX:Number;
		
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
					dispatchEventWith(ControlsEvent.TAP, false, displayObject);
				}
			}			
		}
		
		protected function getTouchOffsetX(touch:Touch, target:DisplayObject):Number
		{
			return touch.getLocation(target).x - touch.getPreviousLocation(target).x;			
		}
	}
}