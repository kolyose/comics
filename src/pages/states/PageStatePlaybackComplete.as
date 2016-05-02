package pages.states
{
	import pages.IPage;

	public class PageStatePlaybackComplete extends BasePageState implements IPageState
	{
		public function PageStatePlaybackComplete(page:IPage, statesFactory:IPageStatesFactory)
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