package controller
{
	import events.ApplicationEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import starling.events.Event;
	
	public class HandleMoveCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		public function HandleMoveCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			dispatchWith(ApplicationEvent.MOVE, false, event.data);
		}
	}
}