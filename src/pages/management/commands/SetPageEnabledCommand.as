package pages.management.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	import starling.events.Event;
	
	public class SetPageEnabledCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		[Inject]
		public var event:Event;
		
		public function SetPageEnabledCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			if (!pagesManager.getCurrentPage()) return;
			
			var bEnabled:Boolean = event.data;
			
			if (bEnabled)
			{
				pagesManager.getCurrentPage().enable();
			}
			else
			{
				pagesManager.getCurrentPage().disable();
			}
		}
	}
}