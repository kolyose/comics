package application.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import starling.events.Event;
	
	public class ScrollPageCompleteCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		public function ScrollPageCompleteCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			
		}
	}
}