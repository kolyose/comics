package pages.states
{
	import pages.IPage;
	
	public class PageStateReadyToPlay extends BasePageState implements IPageState
	{
		public function PageStateReadyToPlay(page:IPage, statesFactory:IPageStatesFactory)
		{
			super(page, statesFactory);
		}
		
		override public function play():void
		{
			_page.startPlayback();
			_page.applyState(pageStatesFactory.getStatePlaybackStarted(_page));
		}
	}
}