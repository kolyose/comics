package application.commands
{
	import events.CommandEvent;
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
			
			if (offset.y > initialPagePosition.y - pagesManager.getCurrentPage().container.y)
			{	
				offset.y = initialPagePosition.y - pagesManager.getCurrentPage().container.y;
			}		
			
			if (offset.y < initialPagePosition.y - (pagesManager.getCurrentPage().container.scaleY * Settings.getInstance().HEIGHT - Settings.getInstance().HEIGHT) - pagesManager.getCurrentPage().container.y)
			{	
				offset.y = initialPagePosition.y - (pagesManager.getCurrentPage().container.scaleY * Settings.getInstance().HEIGHT - Settings.getInstance().HEIGHT) - pagesManager.getCurrentPage().container.y;
			}				
			
			var remainingOffset:Point;
			
			if (offset.x > initialPagePosition.x - pagesManager.getCurrentPage().container.x)
			{	
				remainingOffset = new Point(offset.x - (initialPagePosition.x - pagesManager.getCurrentPage().container.x), 0);
				offset.x = initialPagePosition.x - pagesManager.getCurrentPage().container.x;
				applyOffset(offset);
				dispatchWith(CommandEvent.MOVE_PAGE, false, remainingOffset);	
				return;
			}		
			
			if (offset.x < initialPagePosition.x - (pagesManager.getCurrentPage().container.scaleX * Settings.getInstance().WIDTH - Settings.getInstance().WIDTH) - pagesManager.getCurrentPage().container.x)
			{	
				remainingOffset = new Point(offset.x - (initialPagePosition.x - (pagesManager.getCurrentPage().container.scaleX * Settings.getInstance().WIDTH - Settings.getInstance().WIDTH) - pagesManager.getCurrentPage().container.x), 0);
				offset.x = initialPagePosition.x - (pagesManager.getCurrentPage().container.scaleX * Settings.getInstance().WIDTH - Settings.getInstance().WIDTH) - pagesManager.getCurrentPage().container.x;
				applyOffset(offset);
				dispatchWith(CommandEvent.MOVE_PAGE, false, remainingOffset);	
				return;
			}	
			
			applyOffset(offset);
		}
		
		private function applyOffset(offset:Point):void
		{
			pagesManager.getCurrentPage().container.x += offset.x;
			pagesManager.getCurrentPage().container.y += offset.y;
		}
	}
}