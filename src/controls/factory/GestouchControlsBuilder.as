package controls.factory
{
	import controls.GestouchControls;
	
	import starling.display.DisplayObject;

	public class GestouchControlsBuilder extends BaseControlsBuilder
	{
		public function GestouchControlsBuilder()
		{
			super();
		}
		
		override public function createControls(stage:DisplayObject):void
		{
			_controls = new GestouchControls(stage);
		}
	}
}