package pages.playback.consecutive.states
{
	import pages.management.vo.TweenPropertiesVO;
	import pages.playback.IPlaybackStrategyState;

	public interface IConsecutivePlaybackStrategyWithZoomState extends IPlaybackStrategyState
	{
		function zoom(tweenVO:TweenPropertiesVO):void;
	}
}