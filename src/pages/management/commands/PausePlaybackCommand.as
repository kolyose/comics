package pages.management.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	public class PausePlaybackCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
				
		public function PausePlaybackCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			pagesManager.pause();
		}
	}
}