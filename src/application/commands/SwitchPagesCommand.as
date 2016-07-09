package application.commands
{
	import events.ApplicationEvent;
	import events.CommandEvent;
	import events.PagesEvent;
	import events.ViewEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	import pages.management.strategies.ISwitchPagesStrategy;
	
	import starling.events.Event;
	
	public class SwitchPagesCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		[Inject]
		public var pagesManager:IPagesManager;
		
		[Inject]
		public var switchPagesStrategy:ISwitchPagesStrategy;
					
		public function SwitchPagesCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var pageNumber:uint =uint(event.data); 			
			if ( pageNumber < 0 || pageNumber >= this.pagesManager.intPagesCount)
			{
				dispatchWith(ApplicationEvent.SWITCH_PAGES_COMPLETE);
				return;			
			}
		
			dispatchWith(PagesEvent.ADD_PAGE, false, pageNumber);
			switchPagesStrategy.switchToPageByNumber(pageNumber);
		}
	}
}