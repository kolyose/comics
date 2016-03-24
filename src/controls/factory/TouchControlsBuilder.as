package controls.factory
{
	import controls.TouchControls;
	
	import starling.display.DisplayObject;
	
	public class TouchControlsBuilder extends BaseControlsBuilder
	{
		public function TouchControlsBuilder()
		{
			super();
		}
		
		override public function createControls(stage:DisplayObject):void
		{
			_controls = new TouchControls(stage);
		}
	}
}