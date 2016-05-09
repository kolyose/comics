package pages.playback.consecutive.states
{
	import pages.playback.consecutive.ConsecutivePlaybackStrategyWithZoom;

	public class ConsecutivePlaybackStrategyWithZoomStateZoomingIN extends BaseConsecutivePlaybackStrategyWithZoomState implements IConsecutivePlaybackStrategyWithZoomState
	{
		public function ConsecutivePlaybackStrategyWithZoomStateZoomingIN(strategy:ConsecutivePlaybackStrategyWithZoom, factory:IConsecutivePlaybackStrategyWithZoomStatesFactory)
		{
			super(strategy, factory);
		}
	}
}