package pages.states
{
	import pages.IPage;
	import pages.management.vo.TweenPropertiesVO;
	
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
		
		override public function zoom(tweenVO:TweenPropertiesVO):void
		{
			_page.zoomPlayback(tweenVO);
		}
	}
}