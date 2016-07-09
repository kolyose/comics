package controls.commands
{
	import events.ApplicationEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import starling.events.Event;
	
	public class HandleDoubleTapCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		[Inject]
		public var playbackSettings:IPlaybackSettings;
		
		public function HandleDoubleTapCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			dispatchWith(ApplicationEvent.DOUBLE_TAP, false, event.data);
		}
	}
}