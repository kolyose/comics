package pages.management.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	public class ReplayCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function ReplayCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			pagesManager.replay();
		}
	}
}