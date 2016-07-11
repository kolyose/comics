package controls.commands
{
	import events.ApplicationEvent;
	import events.CommandEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import starling.display.Button;
	import starling.display.Stage;
	import starling.events.Event;
	
	public class HandleTapCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		public function HandleTapCommand()
		{
			super();
		}
		
		//DEPRECATED
		override public function execute():void
		{				
			switch (event.data.name)
			{
				case InstanceNames.LOCK_CONTAINER:
				{					
					//dispatchWith(ApplicationEvent.LOCK);
					//dispatchWith(ApplicationEvent.PAUSE, false, true);//show pause menu
					break;
				}
					
				default:						
					break;
			}
		}
	}
}