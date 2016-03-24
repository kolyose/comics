package pages.management.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	public class StopPlaybackCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function StopPlaybackCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			pagesManager.stop();
		}
	}
}