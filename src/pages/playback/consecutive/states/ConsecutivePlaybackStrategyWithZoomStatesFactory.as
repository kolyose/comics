package pages.playback.consecutive.states
{
	import pages.playback.consecutive.ConsecutivePlaybackStrategyWithZoom;

	public class ConsecutivePlaybackStrategyWithZoomStatesFactory implements IConsecutivePlaybackStrategyWithZoomStatesFactory
	{
		protected var _strategy:ConsecutivePlaybackStrategyWithZoom;
		
		public function ConsecutivePlaybackStrategyWithZoomStatesFactory(strategy:ConsecutivePlaybackStrategyWithZoom)
		{
			_strategy = strategy;
		}
		
		public function getStateNoZoom():IConsecutivePlaybackStrategyWithZoomState
		{
			return new ConsecutivePlaybackStrategyWithZoomStateNoZoom(_strategy, this);	
		}
		
		public function getStateZoomed():IConsecutivePlaybackStrategyWithZoomState
		{
			return new ConsecutivePlaybackStrategyWithZoomStateZoomed(_strategy, this);	
		}
		
		public function getStateZoomingIN():IConsecutivePlaybackStrategyWithZoomState
		{
			return new ConsecutivePlaybackStrategyWithZoomStateZoomingIN(_strategy, this);
		}
		
		public function getStateZoomingOUT():IConsecutivePlaybackStrategyWithZoomState
		{
			return new ConsecutivePlaybackStrategyWithZoomStateZoomingOUT(_strategy, this);
		}
	}
}