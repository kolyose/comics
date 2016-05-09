package controls
{
	import events.ApplicationEvent;
	import events.ControlsEvent;
	import events.ModelEvent;
	
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;
	
	public class InputController extends Actor implements IInputController
	{
		private var _controls:IControls;
		
		public function InputController()
		{
			super();
		}
		
		public function injectControls(controls:IControls):void
		{
			_controls = controls;
		}
		
		public function init():void
		{
			addListeners();
		}
		
		public function reset():void
		{
			removeListeners();
		}
		
		public function enable():void
		{
			_controls.enable();
		}
		
		public function disable():void
		{
			_controls.disable();	
		}
		
		private function addListeners():void
		{
			(_controls as EventDispatcher).addEventListener(ControlsEvent.TAP, tapHandler);
			(_controls as EventDispatcher).addEventListener(ControlsEvent.DOUBLE_TAP, doubleTapHandler);
			(_controls as EventDispatcher).addEventListener(ControlsEvent.MOVE, moveHandler);
			(_controls as EventDispatcher).addEventListener(ControlsEvent.MOVE_COMPLETE, moveCompleteHandler);
		}
		
		private function removeListeners():void
		{
			if (!_controls) return;
			
			(_controls as EventDispatcher).removeEventListener(ControlsEvent.TAP, tapHandler);
			(_controls as EventDispatcher).removeEventListener(ControlsEvent.DOUBLE_TAP, doubleTapHandler);
			(_controls as EventDispatcher).removeEventListener(ControlsEvent.MOVE, moveHandler);
			(_controls as EventDispatcher).removeEventListener(ControlsEvent.MOVE_COMPLETE, moveCompleteHandler);
		}
		
		private function moveCompleteHandler(event:Event, offset:Point):void
		{			
			dispatchWith(ModelEvent.HANDLE_MOVE_COMPLETE, false, offset);
		}
		
		private function moveHandler(event:Event, offset:Point):void
		{			
			dispatchWith(ModelEvent.HANDLE_MOVE, false, offset);			
		}
		
		private function tapHandler(event:Event):void
		{
			dispatchWith(ModelEvent.HANDLE_TAP, false, event.data);	
		}
		
		private function doubleTapHandler(event:Event):void
		{
			dispatchWith(ModelEvent.HANDLE_DOUBLE_TAP, false, event.data);	
		}
	}
}