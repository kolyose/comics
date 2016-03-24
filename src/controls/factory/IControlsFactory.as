package controls.factory
{
	import controls.IControls;
	
	import starling.display.DisplayObject;

	public interface IControlsFactory
	{
		function getControls(stage:DisplayObject):IControls;
		function getBuilder():IControlsBuilder;
	}
}