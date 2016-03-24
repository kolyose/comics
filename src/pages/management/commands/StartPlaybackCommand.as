package pages.management.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	public class StartPlaybackCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function StartPlaybackCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			pagesManager.play();
		}
	}
}