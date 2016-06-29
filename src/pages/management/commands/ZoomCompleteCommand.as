package pages.management.commands
{
	import events.ApplicationEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	public class ZoomCompleteCommand extends Command
	{
		public function ZoomCompleteCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			dispatchWith(ApplicationEvent.ZOOM_COMPLETE);
		}
	}
}