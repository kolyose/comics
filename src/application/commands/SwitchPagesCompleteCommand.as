package application.commands
{
	import events.ApplicationEvent;
	import events.PagesEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
		
	public class SwitchPagesCompleteCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		[Inject]
		public var playbackSettings:IPlaybackSettings;
		
		public function SwitchPagesCompleteCommand()
		{
			super();
		}
		
		override public function execute():void
		{			
			dispatchWith(PagesEvent.ADD_NEIGHBOUR_PAGES, false, pagesManager.currentPageNumber);	
		}
	}
}