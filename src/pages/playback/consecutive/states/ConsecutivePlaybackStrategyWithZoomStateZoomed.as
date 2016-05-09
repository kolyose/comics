package pages.playback.consecutive.states
{
	import pages.playback.consecutive.ConsecutivePlaybackStrategyWithZoom;

	public class ConsecutivePlaybackStrategyWithZoomStateZoomed extends BaseConsecutivePlaybackStrategyWithZoomState implements IConsecutivePlaybackStrategyWithZoomState
	{
		public function ConsecutivePlaybackStrategyWithZoomStateZoomed(strategy:ConsecutivePlaybackStrategyWithZoom, factory:IConsecutivePlaybackStrategyWithZoomStatesFactory)
		{
			super(strategy, factory);
		}
	}
}