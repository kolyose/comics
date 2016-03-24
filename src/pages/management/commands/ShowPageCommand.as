package pages.management.commands
{
	import events.ApplicationEvent;
	import events.ModelEvent;
	import events.ViewEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	import starling.events.Event;
	
	import states.IApplicationStatesFactory;
	
	public class ShowPageCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		[Inject]
		public var pagesManager:IPagesManager;
		
		[Inject]
		public var applicationStatesFactory:IApplicationStatesFactory;
		
		public function ShowPageCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var pageNumber:uint = uint(event.data);			
			if (pageNumber < 0 || pageNumber >= pagesManager.intPagesCount) return;
					
			//dispatchWith(ApplicationEvent.APPLY_STATE, false, applicationStatesFactory.getStateLock());
			dispatchWith(ApplicationEvent.LOCK);
			
			pagesManager.currentPageNumber = pageNumber;
			
			dispatchWith(ViewEvent.RESET_PAGES_VIEW);
			
			var newPagesPositionX:Number = - pageNumber * (Settings.getInstance().WIDTH + Settings.getInstance().distanceBetweenPages);
			dispatchWith(ViewEvent.SET_PAGES_POSITION, false, newPagesPositionX);
			pagesManager.containerPositionX = newPagesPositionX;	
			
			dispatchWith(ModelEvent.ADD_PAGE, false, pagesManager.currentPageNumber);
			dispatchWith(ModelEvent.SWITCH_PAGES_COMPLETE);			
			dispatchWith(ModelEvent.ADD_NEIGHBOUR_PAGES, false, pagesManager.currentPageNumber);
		}
	}
}