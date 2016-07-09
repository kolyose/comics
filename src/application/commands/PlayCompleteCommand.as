package application.commands
{
	import events.ApplicationEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	public class PlayCompleteCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		[Inject]
		public var playbackSettings:IPlaybackSettings;
		
		public function PlayCompleteCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var nextPageNumber:uint =  pagesManager.currentPageNumber+1;
			if (nextPageNumber < pagesManager.intPagesCount)
			{					
				dispatchWith(ApplicationEvent.SWITCH_PAGES, false, nextPageNumber);
			}
			else
			{
				dispatchWith(ApplicationEvent.THE_END);
			}
		}
	}
}