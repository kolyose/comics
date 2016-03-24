package pages.management.commands
{
	import events.ApplicationEvent;
	import events.ModelEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	import states.IApplicationStatesFactory;
	
	public class SwitchPagesCompleteCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		[Inject]
		public var applicationStatesFactory:IApplicationStatesFactory;
		
		public function SwitchPagesCompleteCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			dispatchWith(ModelEvent.ADD_PAGE, false, pagesManager.currentPageNumber);
			dispatchWith(ApplicationEvent.UNLOCK);
			dispatchWith(ApplicationEvent.PLAY);
			dispatchWith(ModelEvent.ADD_NEIGHBOUR_PAGES, false, pagesManager.currentPageNumber);
		}
	}
}