package application.commands
{
	import events.CommandEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.IPage;
	import pages.management.IPagesManager;
	
	import starling.events.Event;
	
	public class ResetSubsequentPagesCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function ResetSubsequentPagesCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var startingPageNumber:uint = (event.data && event.data > -1) ? uint(event.data) : pagesManager.currentPageNumber+1;   
			var totalPagesCount:uint = pagesManager.intPagesCount;
			for (var i:int=startingPageNumber; i < totalPagesCount; i++)
			{
				dispatchWith(CommandEvent.RESET_PAGE, false, i);
			}
		}
		
	}
}