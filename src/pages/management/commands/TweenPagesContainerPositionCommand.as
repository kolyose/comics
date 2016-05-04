package pages.management.commands
{
	import events.ModelEvent;
	import events.ViewEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	import pages.management.vo.PagesContainerPositionTweenPropertiesVO;
	
	import starling.events.Event;
	
	public class TweenPagesContainerPositionCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		[Inject]
		public var pagesManager:IPagesManager;
	
		public function TweenPagesContainerPositionCommand()
		{
			super();
		}
		
		//TODO: probably the command is redundant? we can use ViewEvent.TWEEN_PAGES_CONTAINER_POSITION directly instead
		override public function execute():void
		{
			dispatchWith(ViewEvent.CLEAR_PAGES_CONTAINER_POSITION_TWEEN);						
			dispatchWith(ViewEvent.TWEEN_PAGES_CONTAINER_POSITION, false, event.data as PagesContainerPositionTweenPropertiesVO);	
		}		
	}
}