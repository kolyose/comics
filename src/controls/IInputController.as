package controls
{
	public interface IInputController
	{
		function injectControls(controls:IControls):void;
		function init():void;
		function reset():void;
		function enable():void;
		function disable():void;
	}
}