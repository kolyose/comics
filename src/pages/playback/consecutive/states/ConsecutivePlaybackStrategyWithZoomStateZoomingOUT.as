package pages.playback.consecutive.states
{
	import pages.playback.consecutive.ConsecutivePlaybackStrategyWithZoom;

	public class ConsecutivePlaybackStrategyWithZoomStateZoomingOUT extends BaseConsecutivePlaybackStrategyWithZoomState implements IConsecutivePlaybackStrategyWithZoomState
	{
		public function ConsecutivePlaybackStrategyWithZoomStateZoomingOUT(strategy:ConsecutivePlaybackStrategyWithZoom, factory:IConsecutivePlaybackStrategyWithZoomStatesFactory)
		{
			super(strategy, factory);
		}
	}
}