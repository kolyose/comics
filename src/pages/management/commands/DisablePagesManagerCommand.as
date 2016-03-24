package pages.management.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	public class DisablePagesManagerCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function DisablePagesManagerCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			pagesManager.disable();
		}
	}
}