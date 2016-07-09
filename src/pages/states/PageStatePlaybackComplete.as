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
		
		override public function replay():void	
		{
			_page.restartPlayback();
			_page.applyState(pageStatesFactory.getStatePlaybackStarted(_page));
		}
		
		override public function zoom(tweenVO:TweenPropertiesVO):void
		{
			_page.zoomPlayback(tweenVO);
		}
		
		override public function zoomComplete():void
		{
			_page.dispatchZoomComplete();
		}
		
		override public function reset():void
		{
			_page.resetPlayback();
			_page.applyState(pageStatesFactory.getStateReadyToPlay(_page));
		}
		
	}
}