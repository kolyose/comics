package controller
{
	import events.ApplicationEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	import starling.events.Event;
	
	public class MovePageCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function MovePageCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			dispatchWith(ApplicationEvent.PAUSE);
						
			var xOffset:Number = Number(event.data);
			pagesManager.movePage(xOffset);
		}
	}
}