package controls.factory
{
	import controls.IControls;
	import controls.TouchControls;
	
	import starling.display.DisplayObject;
	
	public class BaseControlsBuilder implements IControlsBuilder
	{
		protected var _controls:IControls;
		
		public function BaseControlsBuilder()
		{
		}
		
		public function createControls(stage:DisplayObject):void
		{
		}
		
		public function initControls():void
		{
			_controls.init();
		}
		
		public function enableControls():void
		{
			_controls.enable();	
		}
		
		public function disableControls():void
		{
			_controls.disable();
		}
		
		public function getControls():IControls
		{
			return _controls;
		}
	}
}