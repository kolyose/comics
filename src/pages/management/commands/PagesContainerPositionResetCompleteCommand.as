package pages.management.commands
{
	import events.ApplicationEvent;
	import events.ModelEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	public class PagesContainerPositionResetCompleteCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		[Inject]
		public var playbackSettings:IPlaybackSettings;
		
		public function PagesContainerPositionResetCompleteCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			dispatchWith(ApplicationEvent.UNLOCK);
			dispatchWith(ApplicationEvent.RESUME);
		}
	}
}