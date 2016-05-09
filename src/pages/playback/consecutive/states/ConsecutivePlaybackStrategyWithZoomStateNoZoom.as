package pages.playback.consecutive.states
{
	import pages.management.vo.TweenPropertiesVO;
	import pages.playback.consecutive.ConsecutivePlaybackStrategyWithZoom;

	public class ConsecutivePlaybackStrategyWithZoomStateNoZoom extends BaseConsecutivePlaybackStrategyWithZoomState implements IConsecutivePlaybackStrategyWithZoomState
	{
		public function ConsecutivePlaybackStrategyWithZoomStateNoZoom(strategy:ConsecutivePlaybackStrategyWithZoom, factory:IConsecutivePlaybackStrategyWithZoomStatesFactory)
		{
			super(strategy, factory);
		}
		
		override public function zoom(tweenVO:TweenPropertiesVO):void
		{
			//_strategy.startZooming(tweenVO);
			_strategy.applyState(_statesFactory.getStateZoomingIN());
			//_strategy.
		}
	}
}