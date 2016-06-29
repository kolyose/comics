package pages.playback
{
	import org.robotlegs.starling.mvcs.Actor;
	
	import pages.IPage;
	import pages.playback.consecutive.ConsecutivePlaybackStrategy;
	import pages.playback.consecutive.ConsecutivePlaybackStrategyWithZoom;
	import pages.playback.consecutive.states.ConsecutivePlaybackStrategyWithZoomStatesFactory;
	
	import starling.display.Sprite;
	
	public class PlaybackStrategiesFactory extends Actor implements IPlaybackStrategiesFactory
	{				
		public function getConsecutivePlaybackStrategy(page:IPage):IPlaybackStrategy
		{
			//TODO: refactor to different method
			//return new ConsecutivePlaybackStrategy(page);
			
			var strategy:IPlaybackStrategy = new ConsecutivePlaybackStrategyWithZoom(page);			
			var factory:ConsecutivePlaybackStrategyWithZoomStatesFactory = new ConsecutivePlaybackStrategyWithZoomStatesFactory(strategy as ConsecutivePlaybackStrategyWithZoom);
			strategy.applyState(factory.getStateNoZoom());
			return strategy;
		}
	}
}