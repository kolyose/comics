package controller
{
	import events.ViewEvent;
	
	import flash.geom.Point;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	import starling.events.Event;
	
	public class ScrollPageCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function ScrollPageCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var offset:Point = Point(event.data);
			var initialPagePosition:Point = 
				new Point(pagesManager.currentPageNumber * (Settings.getInstance().WIDTH + Settings.getInstance().distanceBetweenPages), pagesManager.containerPosition.y);
			
			if (offset.x > initialPagePosition.x - pagesManager.getCurrentPage().container.x)
			{	
				offset.x = initialPagePosition.x - pagesManager.getCurrentPage().container.x;
			}		
			
			if (offset.x < initialPagePosition.x - (pagesManager.getCurrentPage().container.width - Settings.getInstance().WIDTH) - pagesManager.getCurrentPage().container.x)
			{	
				offset.x = initialPagePosition.x - (pagesManager.getCurrentPage().container.width - Settings.getInstance().WIDTH) - pagesManager.getCurrentPage().container.x;
			}	
			
			if (offset.y > initialPagePosition.y - pagesManager.getCurrentPage().container.y)
			{	
				offset.y = initialPagePosition.y - pagesManager.getCurrentPage().container.y;
			}		
			
			if (offset.y < initialPagePosition.y - (pagesManager.getCurrentPage().container.height - Settings.getInstance().HEIGHT) - pagesManager.getCurrentPage().container.y)
			{	
				offset.y = initialPagePosition.y - (pagesManager.getCurrentPage().container.height - Settings.getInstance().HEIGHT) - pagesManager.getCurrentPage().container.y;
			}	
			
			pagesManager.getCurrentPage().container.x += offset.x;
			pagesManager.getCurrentPage().container.y += offset.y;
		}
	}
}