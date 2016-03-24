package pages.management.commands
{
	import events.ApplicationEvent;
	import events.ModelEvent;
	import events.ViewEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	import pages.management.strategies.ISwitchPagesStrategy;
	
	import starling.events.Event;
	
	import states.IApplicationStatesFactory;
	
	public class SwitchPagesCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		[Inject]
		public var pagesManager:IPagesManager;
		
		[Inject]
		public var switchPagesStrategy:ISwitchPagesStrategy;
		
		[Inject]
		public var applicationStatesFactory:IApplicationStatesFactory;
				
		public function SwitchPagesCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var pageNumber:uint =uint(event.data); 			
			if ( pageNumber < 0 || pageNumber >= this.pagesManager.intPagesCount)
			{
				dispatchWith(ApplicationEvent.UNLOCK);
				return;			
			}
		
			switchPagesStrategy.switchToPageByNumber(pageNumber);
		}
	}
}