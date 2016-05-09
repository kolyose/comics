package pages.playback.consecutive.states
{
	import pages.management.vo.TweenPropertiesVO;
	import pages.playback.IPlaybackStrategy;
	import pages.playback.consecutive.ConsecutivePlaybackStrategyWithZoom;

	public class BaseConsecutivePlaybackStrategyWithZoomState implements IConsecutivePlaybackStrategyWithZoomState
	{
		protected var _strategy:ConsecutivePlaybackStrategyWithZoom;
		protected var _statesFactory:IConsecutivePlaybackStrategyWithZoomStatesFactory;
		
		public function BaseConsecutivePlaybackStrategyWithZoomState(strategy:ConsecutivePlaybackStrategyWithZoom, factory:IConsecutivePlaybackStrategyWithZoomStatesFactory)
		{
			_strategy = strategy;
			_statesFactory = factory;
		}
		
		public function zoom(tweenVO:TweenPropertiesVO):void
		{
		}
	}
}