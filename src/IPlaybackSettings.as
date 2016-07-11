package
{
	public interface IPlaybackSettings
	{
		function set autoplayModeEnabled(value:Boolean):void;
		function get autoplayModeEnabled():Boolean;
		function set playbackSpeed(value:uint):void;
		function get playbackSpeed():uint;
	}
}