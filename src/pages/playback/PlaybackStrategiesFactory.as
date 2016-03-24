package pages.playback
{
	import org.robotlegs.starling.mvcs.Actor;
	
	import pages.IPage;
	
	import starling.display.Sprite;
	
	public class PlaybackStrategiesFactory extends Actor implements IPlaybackStrategiesFactory
	{				
		public function getConsecutivePlaybackStrategy(page:IPage):IPlaybackStrategy
		{
			return new ConsecutivePlaybackStrategy(page);
		}
	}
}