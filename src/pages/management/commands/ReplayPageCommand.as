package pages.management.commands
{
	import events.ModelEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	public class ReplayPageCommand extends Command
	{
		public function ReplayPageCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			dispatchWith(ModelEvent.STOP_PLAYBACK);
			dispatchWith(ModelEvent.START_PLAYBACK);
		}
	}
}