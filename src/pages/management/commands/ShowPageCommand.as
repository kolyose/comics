package pages.management.commands
{
	import events.ApplicationEvent;
	import events.CommandEvent;
	import events.ViewEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	import starling.events.Event;
	
	public class ShowPageCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		[Inject]
		public var pagesManager:IPagesManager;
			
		public function ShowPageCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var pageNumber:uint = uint(event.data);			
			if (pageNumber < 0 || pageNumber >= pagesManager.intPagesCount) return;
			
			pagesManager.currentPageNumber = pageNumber;
			
			dispatchWith(ViewEvent.RESET_PAGES_VIEW);
			
			var newPagesPositionX:Number = - pageNumber * (Settings.getInstance().WIDTH + Settings.getInstance().distanceBetweenPages);
			dispatchWith(ViewEvent.SET_PAGES_POSITION, false, newPagesPositionX);
			pagesManager.containerPosition.x = newPagesPositionX;	
			
			dispatchWith(ApplicationEvent.SWITCH_PAGES_COMPLETE);		
		}
	}
}