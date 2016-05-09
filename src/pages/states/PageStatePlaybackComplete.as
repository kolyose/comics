package pages.states
{
	import pages.IPage;
	import pages.management.vo.TweenPropertiesVO;

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
		
		override public function zoom(tweenVO:TweenPropertiesVO):void
		{
			_page.zoomPlayback(tweenVO);
		}
	}
}