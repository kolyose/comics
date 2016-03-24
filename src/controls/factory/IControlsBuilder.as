package controls.factory
{
	import controls.IControls;
	
	import starling.display.DisplayObject;

	public interface IControlsBuilder
	{
		function createControls(stage:DisplayObject):void;
		function getControls():IControls;
		function initControls():void;
		function enableControls():void;
		function disableControls():void;
	}
}