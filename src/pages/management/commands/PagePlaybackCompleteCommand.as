package pages.management.commands
{
	import events.ApplicationEvent;
	import events.ModelEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	public class PagePlaybackCompleteCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function PagePlaybackCompleteCommand()
		{
			super();
		}
		
		override public function execute():void
		{				
		//	dispatchWith(ApplicationEvent.PAUSE);
			pagesManager.stop();
			dispatchWith(ApplicationEvent.LOCK);
			pagesManager.switchPages(pagesManager.currentPageNumber+1);
		}
	}
}