package controller
{
	import events.ApplicationEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	public class HandleDoubleTapCommand extends Command
	{
		public function HandleDoubleTapCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			dispatchWith(ApplicationEvent.ZOOM);
		}
	}
}