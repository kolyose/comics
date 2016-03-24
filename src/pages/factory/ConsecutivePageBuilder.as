package pages.factory
{
	import data.PageDO;
	
	import pages.ConsecutivePage;
	import pages.IPage;
	import pages.playback.IPlaybackStrategiesFactory;
	import pages.states.IPageState;
	
	public class ConsecutivePageBuilder extends BasePageBuilder
	{
		override public function createPage(/*data:PageDO*/):void
		{
			_page = null;
			_page = new ConsecutivePage();
		}
		
		override public function initState():void
		{
			_page.applyState(pageStatesFactory.getStateInitial(_page));
		}
		
		override public function initPlaybackStrategy():void
		{
			_page.injectPlaybackStrategy(playbackStrategiesFactory.getConsecutivePlaybackStrategy(_page));
			_page.activatePlayback();
		}
		
		override public function initItemsFactory():void
		{
			_page.injectItemsFactory(itemsFactory);
		}
		
		override public function getPage():IPage
		{
			return _page;
		}
	}
}