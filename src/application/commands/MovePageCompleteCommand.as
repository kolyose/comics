package application.commands
{
	import events.ApplicationEvent;
	
	import flash.geom.Point;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	import starling.events.Event;
	
	public class MovePageCompleteCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function MovePageCompleteCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var xOffset:Number = Point(event.data).x;
			var intDirection:int = (xOffset < 0) ? 1 : -1;
			var pageNumber:uint = pagesManager.currentPageNumber + intDirection;
			
			if (Math.abs(xOffset) > Settings.getInstance().initiateSwitchPagesOffset && pageNumber > -1 && pageNumber < Settings.getInstance().intPagesCount)
			{								
				//pagesManager.switchPages(pageNumber); 
				dispatchWith(ApplicationEvent.SWITCH_PAGES, false, pageNumber);
			}
			else
			{
				//pagesManager.resetPagePosition();
				dispatchWith(ApplicationEvent.RESET_POSITION);
			}
		}
	}
}