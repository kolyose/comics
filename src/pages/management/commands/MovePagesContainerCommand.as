package pages.management.commands
{
	import events.ViewEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	import starling.events.Event;
	
	public class MovePagesContainerCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		[Inject]
		public var event:Event;
		
		public function MovePagesContainerCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var xOffset:Number = Number(event.data);
			
			if (this.pagesManager.temporaryContainerPositionX + xOffset > Settings.getInstance().WIDTH/4
				|| this.pagesManager.temporaryContainerPositionX + xOffset < - this.pagesManager.intPagesCount * Settings.getInstance().WIDTH - Settings.getInstance().WIDTH/4)
			{
				return;	
			}
			
			this.pagesManager.temporaryContainerPositionX += xOffset;
			dispatchWith(ViewEvent.MOVE_PAGES_CONTAINER, false, xOffset);
		}
	}
}