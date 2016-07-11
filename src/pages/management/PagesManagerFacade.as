package pages.management
{
	import data.PageDO;
	
	import events.CommandEvent;
	import events.ModelEvent;
	import events.ViewEvent;
	
	import flash.geom.Point;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import pages.IPage;
	import pages.management.vo.TweenPropertiesVO;
	
	
	/**
	 * The class corresponds to Facade pattern in order to provide some kind of 'gates' for PagesManager component logic
	 * and to be interchangable with the OLD PagesManager class  
	 **/
	
	public class PagesManagerFacade extends Actor implements IPagesManager
	{
		[Inject]
		public var model:PagesModel;
		
		public function PagesManagerFacade()
		{
			super();
		}
		
		public function movePage(xOffset:Number):void
		{
			dispatchWith(CommandEvent.MOVE_PAGES_CONTAINER, false, xOffset);
		}
		
		/*public function enable():void
		{
			dispatchWith(CommandEvent.SET_PAGE_ENABLED, false, true);
		}
		
		public function disable():void
		{
			dispatchWith(CommandEvent.SET_PAGE_ENABLED, false, false);
		}*/
		
		public function play():void
		{
			getCurrentPage().play();
		}
		
		public function replay():void
		{
			getCurrentPage().replay();
		}
		
		public function pause():void
		{
			getCurrentPage().pause();
		}
		
		public function zoom(tweenVO:TweenPropertiesVO):void
		{
			getCurrentPage().zoom(tweenVO);
		}
		
		public function get currentPageNumber():uint
		{
			return this.model.currentPageNumber;
		}
		
		public function set currentPageNumber(number:uint):void
		{
			this.model.currentPageNumber = number;
			dispatchWith(ModelEvent.PAGE_NUMBER_CHANGED, false, currentPageNumber);
		}
		
		public function set loadingPageNumber(number:uint):void
		{
			this.model.loadingPageNumber = number;
		}
		
		public function get intPagesCount():uint
		{
			return this.model.intPagesCount;
		}
		
		public function get loadingPageNumber():uint
		{
			return this.model.loadingPageNumber;
		}
		
		public function get containerPosition():Point
		{
			return this.model.containerPosition;	
		}
		
		public function set containerPosition(value:Point):void
		{
			this.model.containerPosition = value;
		}
		
		public function getPageByNumber(pageNumber:uint):IPage
		{
			if (pageNumber < 0 || pageNumber >= this.model.vPages.length) return null;
			
			return this.model.vPages[pageNumber];
		}
		
		public function setPageByNumber(pageNumber:uint, page:IPage):void
		{
			this.model.vPages[pageNumber] = page;
		}
		
		public function getCurrentPage():IPage
		{
			return getPageByNumber(currentPageNumber);
		}
		
		public function setPageData(pageData:PageDO):void
		{
			this.model.setPageData(pageData);
		}
				
		public function get temporaryContainerPositionX():Number
		{
			return this.model.temporatyContainerPositionX;	
		}
		
		public function set temporaryContainerPositionX(value:Number):void
		{
			this.model.temporatyContainerPositionX = value;
		}

	}
}