package pages.management.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	public class ResumePlaybackCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function ResumePlaybackCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			pagesManager.resume();
		}
	}
}