package pages.management.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	public class ZoomPlaybackCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function ZoomPlaybackCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			pagesManager.zoom();
		}
	}
}