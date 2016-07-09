package application.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.IPage;
	import pages.management.IPagesManager;
	
	import starling.events.Event;
	
	public class ResetPageCommand extends Command
	{		
		[Inject]
		public var event:Event;
		
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function ResetPageCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var pageNumber:uint = (event.data && event.data > -1) ? uint(event.data) : pagesManager.currentPageNumber;  
			
			var page:IPage = pagesManager.getPageByNumber(pageNumber);
			if (page)
				page.reset();
		}		
	}
}