package application.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.IPage;
	import pages.management.IPagesManager;
	
	import starling.events.Event;
	
	public class UpdatePlaybackSpeedCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function UpdatePlaybackSpeedCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var totalPagesCount:uint = pagesManager.intPagesCount;
			for (var i:int=0; i < totalPagesCount; i++)
			{
				var page:IPage = pagesManager.getPageByNumber(i);
				if (page)
					page.updatePlaybackSpeed(uint(event.data));
			}
		}
		
	}
}