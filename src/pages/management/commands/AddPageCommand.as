package pages.management.commands
{
	import events.ModelEvent;
	import events.PageEvent;
	import events.PlaybackEvent;
	import events.ViewEvent;
	
	import model.assets.AssetsModel;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.BasePage;
	import pages.ConsecutivePage;
	import pages.IPage;
	import pages.factory.PageFactories;
	import pages.factory.PagePlaybackType;
	import pages.management.IPagesManager;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.EventDispatcher;
	
	public class AddPageCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		[Inject]
		public var pagesManager:IPagesManager;
		
		[Inject]
		public var assetsModel:AssetsModel;
		
		[Inject]
		public var pageFactories:PageFactories;
		
		public function AddPageCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var pageNumber:uint = uint(event.data);
			//means the page number is out of range or the page is already added
			if (pageNumber < 0 || pageNumber >= pagesManager.intPagesCount || pagesManager.getPageByNumber(pageNumber)) return;
			
			initializePage(pageNumber);			
			pagesManager.getPageByNumber(pageNumber).container.x = pageNumber * (Settings.getInstance().WIDTH + Settings.getInstance().distanceBetweenPages);			
			dispatchWith(ViewEvent.ADD_PAGE, false, pagesManager.getPageByNumber(pageNumber).container);
		}
		
		protected function initializePage(pageNumber:uint):void
		{
			//TODO: implement page creation depending on page's type, declared in Config class
			var page:IPage = pageFactories.getFactoryByPageType(PagePlaybackType.CONSEQUTIVE).getPage();	
			page.container.addChild(new Image(assetsModel.getTexture("pageBackground")));		
			pagesManager.setPageByNumber(pageNumber, page);			
			pagesManager.loadingPageNumber = pageNumber;
			
			(page as EventDispatcher).addEventListener(PlaybackEvent.PLAYBACK_COMPLETE, pagePlaybackCompleteHandler);
			assetsModel.loadPageResources(pageNumber);			
		}
		
		protected function pagePlaybackCompleteHandler(event:Event):void
		{
			dispatchWith(ModelEvent.PAGE_PLAYBACK_COMPLETE);
		}
	}
}