package pages.playback.consecutive.states
{
	import pages.playback.IPlaybackStrategyStatesFactory;

	public interface IConsecutivePlaybackStrategyWithZoomStatesFactory extends IPlaybackStrategyStatesFactory
	{
		function getStateNoZoom():IConsecutivePlaybackStrategyWithZoomState;
		function getStateZoomed():IConsecutivePlaybackStrategyWithZoomState;
		function getStateZoomingIN():IConsecutivePlaybackStrategyWithZoomState;
		function getStateZoomingOUT():IConsecutivePlaybackStrategyWithZoomState;
	}
}