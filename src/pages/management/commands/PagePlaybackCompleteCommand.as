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
		
		[Inject]
		public var playbackSettings:IPlaybackSettings;
		
		public function PagePlaybackCompleteCommand()
		{
			super();
		}
		
		override public function execute():void
		{			
			pagesManager.stop();	
			dispatchWith(ApplicationEvent.PLAY_COMPLETE);
			
			if (playbackSettings.autoplayMode)
			{				
				dispatchWith(ApplicationEvent.LOCK);
				pagesManager.switchPages(pagesManager.currentPageNumber+1);
			}
		}
	}
}