package controls
{
	import events.ApplicationEvent;
	import events.ControlsEvent;
	import events.ModelEvent;
	
	import flash.events.IEventDispatcher;
	
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
			(_controls as EventDispatcher).addEventListener(ControlsEvent.SLIDE, slideHandler);
			(_controls as EventDispatcher).addEventListener(ControlsEvent.SLIDE_COMPLETE, slideCompleteHandler);
		}
		
		private function removeListeners():void
		{
			if (!_controls) return;
			
			(_controls as EventDispatcher).removeEventListener(ControlsEvent.TAP, tapHandler);
			(_controls as EventDispatcher).removeEventListener(ControlsEvent.SLIDE, slideHandler);
			(_controls as EventDispatcher).removeEventListener(ControlsEvent.SLIDE_COMPLETE, slideCompleteHandler);
		}
		
		private function slideCompleteHandler(event:Event, xOffset:Number):void
		{
			dispatchWith(ModelEvent.MOVE_PAGE_COMPLETE, false, xOffset);
		}
		
		private function slideHandler(event:Event, xOffset:Number):void
		{
			dispatchWith(ModelEvent.MOVE_PAGE, false, xOffset);			
		}
		
		private function tapHandler(event:Event):void
		{
			dispatchWith(ModelEvent.HANDLE_TAP, false, event.data);	
		}
	}
}