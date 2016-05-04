package pages.states
{
	import pages.IPage;
	
	public class PageStatePlaybackStarted extends BasePageState implements IPageState
	{
		public function PageStatePlaybackStarted(page:IPage, statesFactory:IPageStatesFactory)
		{
			super(page, statesFactory);
		}
		
		override public function pause():void
		{
			_page.pausePlayback();
			_page.applyState(pageStatesFactory.getStatePlaybackPaused(_page));
		}
		
		override public function stop():void
		{
			_page.stopPlayback();
			_page.applyState(pageStatesFactory.getStatePlaybackComplete(_page));
		}
		
		override public function zoom():void
		{
			_page.zoomPlayback();
		}
	}
}