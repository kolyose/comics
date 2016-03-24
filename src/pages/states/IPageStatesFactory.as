package pages.states
{
	import pages.IPage;

	public interface IPageStatesFactory
	{
		function getStateInitial(page:IPage):IPageState;
		function getStatePendingPlay(page:IPage):IPageState;
		function getStateReadyToPlay(page:IPage):IPageState;
		function getStatePlaybackStarted(page:IPage):IPageState;		
		function getStatePlaybackPaused(page:IPage):IPageState;		
		function getStatePlaybackComplete(page:IPage):IPageState;
	}
}