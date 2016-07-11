package pages.factory
{
	import data.PageDO;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import pages.IPage;
	import pages.items.factory.IItemFactory;
	import pages.playback.IPlaybackStrategiesFactory;
	import pages.states.IPageStatesFactory;
	
	public class BasePageBuilder extends Actor implements IPageBuilder
	{
		[Inject]
		public var pageStatesFactory:IPageStatesFactory;
		
		[Inject]
		public var playbackStrategiesFactory:IPlaybackStrategiesFactory;
		
		[Inject]
		public var itemsFactory:IItemFactory;
				
		protected var _page:IPage;
		
		public function BasePageBuilder()
		{
		}
		
		public function createPage(/*data:PageDO*/):void
		{
		}
		
		public function initState():void
		{
		}
		
		public function initPlaybackStrategy():void
		{
		}
		
		public function initItemsFactory():void
		{
			
		}
		
		public function getPage():IPage
		{
			return null;
		}
	}
}