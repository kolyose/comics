package controller
{
	import events.ApplicationEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import starling.events.Event;
	
	public class HandleMoveCompleteCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		public function HandleMoveCompleteCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			dispatchWith(ApplicationEvent.MOVE_COMPLETE, false, event.data);
		}
	}
}