package controls
{
	import events.ControlsEvent;
	
	import flash.geom.Point;
	
	import org.gestouch.events.GestureEvent;
	import org.gestouch.gestures.TapGesture;
	import org.gestouch.gestures.TransformGesture;
	
	import starling.display.DisplayObject;
	import starling.events.EventDispatcher;
	
	public class GestouchControls extends BaseTouchControls
	{
		protected var _tapGesture		:TapGesture;
		protected var _doubleTapGesture	:TapGesture;
		protected var _transformGesture	:TransformGesture;
		protected var _initialTransformLocation:Point;
		
		public function GestouchControls(stage:DisplayObject)
		{
			super(stage);
		}
		
		override public function init():void
		{			
			initGestures();
		}
		
		override public function enable():void
		{
			setGesturesEnabled = true;
		}
		
		override public function disable():void
		{			
			setGesturesEnabled = false;
		}
		
		override public function reset():void
		{
			_tapGesture.removeEventListener(GestureEvent.GESTURE_RECOGNIZED, tapRecognizedHandler);
			_doubleTapGesture.removeEventListener(GestureEvent.GESTURE_RECOGNIZED, doubleTapRecognizedHandler);
			_transformGesture.removeEventListener(GestureEvent.GESTURE_BEGAN, transformBeganHandler);
			_transformGesture.removeEventListener(GestureEvent.GESTURE_CHANGED, transformChangedHandler);
			_transformGesture.removeEventListener(GestureEvent.GESTURE_ENDED, transformEndedHandler);
			_tapGesture = null;
			_doubleTapGesture = null;
			_transformGesture = null;
		}
		
		private function initGestures():void
		{
			_doubleTapGesture = new TapGesture(_stage);			
			_doubleTapGesture.numTapsRequired = 2;
			_doubleTapGesture.maxTapDelay = 200;
			_doubleTapGesture.addEventListener(GestureEvent.GESTURE_RECOGNIZED, doubleTapRecognizedHandler);
			
			_tapGesture = new TapGesture(_stage);
			_tapGesture.requireGestureToFail(_doubleTapGesture);			
			_tapGesture.numTapsRequired = 1;
			_tapGesture.addEventListener(GestureEvent.GESTURE_RECOGNIZED, tapRecognizedHandler);
			
			_transformGesture = new TransformGesture(_stage);
			_transformGesture.addEventListener(GestureEvent.GESTURE_BEGAN, transformBeganHandler);
			_transformGesture.addEventListener(GestureEvent.GESTURE_CHANGED, transformChangedHandler);
			_transformGesture.addEventListener(GestureEvent.GESTURE_ENDED, transformEndedHandler);
		}
		
		private function set setGesturesEnabled(value:Boolean):void
		{
			_tapGesture.enabled = _doubleTapGesture.enabled = _transformGesture.enabled = value;
		}
		
		private function transformBeganHandler(event:GestureEvent):void
		{			
			var transform:TransformGesture = event.target as TransformGesture;
			_initialTransformLocation = new Point(transform.location.x, transform.location.y);
			dispatchEventWith(ControlsEvent.MOVE, false, new Point(transform.offsetX, transform.offsetY));
		}
		
		private function transformChangedHandler(event:GestureEvent):void
		{			
			var transform:TransformGesture = event.target as TransformGesture;
			dispatchEventWith(ControlsEvent.MOVE, false, new Point(transform.offsetX, transform.offsetY));
		}
		
		private function transformEndedHandler(event:GestureEvent):void
		{			
			var transform:TransformGesture = event.target as TransformGesture;			
			dispatchEventWith(ControlsEvent.MOVE_COMPLETE, false, new Point(transform.location.x - _initialTransformLocation.x, transform.location.y - _initialTransformLocation.y));
			_initialTransformLocation = null;
		}
		
		private function tapRecognizedHandler(event:GestureEvent):void
		{				
			dispatchEventWith(ControlsEvent.TAP, false, (event.target as TapGesture).target);
		}
		
		private function doubleTapRecognizedHandler(event:GestureEvent):void
		{			
			dispatchEventWith(ControlsEvent.DOUBLE_TAP, false, (event.target as TapGesture).target);
		}
	}
}