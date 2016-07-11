package application.commands
{
	import flash.net.SharedObject;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	public class SaveLocalDataCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		[Inject]
		public var playbackSettings:IPlaybackSettings;
		
		public function SaveLocalDataCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var sharedObject:SharedObject = SharedObject.getLocal("local");
			sharedObject.data["currentPageNumber"] = pagesManager.currentPageNumber;
			sharedObject.data["playbackSpeed"] = playbackSettings.playbackSpeed;
			sharedObject.data["autoplayModeEnabled"] = playbackSettings.autoplayModeEnabled;
			sharedObject.flush();
		}
	}
}