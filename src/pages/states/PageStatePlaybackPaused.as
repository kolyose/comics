package pages.states
{
	import pages.IPage;

	public class PageStatePlaybackPaused extends BasePageState implements IPageState
	{
		public function PageStatePlaybackPaused(page:IPage, statesFactory:IPageStatesFactory)
		{
			super(page, statesFactory);
		}
		
		override public function play():void
		{
			_page.resumePlayback();
			_page.applyState(pageStatesFactory.getStatePlaybackStarted(_page));
		}
	}
}