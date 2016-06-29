package application.commands
{
	import events.PagesEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	public class ResetPagesPositionCommand extends Command
	{
		public function ResetPagesPositionCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			dispatchWith(PagesEvent.RESET_PAGES_CONTAINER_POSITION);
		}
	}
}