package pages.playback
{
	import pages.IPage;
	
	import starling.display.Sprite;

	public interface IPlaybackStrategiesFactory
	{
		function getConsecutivePlaybackStrategy(page:IPage):IPlaybackStrategy;
	}
}