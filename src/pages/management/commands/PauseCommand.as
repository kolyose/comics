package pages.management.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	public class PauseCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
				
		public function PauseCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			pagesManager.pause();
		}
	}
}