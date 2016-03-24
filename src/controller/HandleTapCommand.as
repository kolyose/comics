package controller
{
	import events.ApplicationEvent;
	import events.ModelEvent;
	
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
		
		override public function execute():void
		{				
			switch (event.data.name)
			{
				case InstanceNames.LOCK_CONTAINER:
				{					
					dispatchWith(ApplicationEvent.PAUSE, false, true);//show pause menu
					break;
				}
				
				//TODO: move the following functionality to PauseMenuMediator class
				case InstanceNames.BTN_REPLAY:
				{
					dispatchWith(ApplicationEvent.PLAY);	
					dispatchWith(ModelEvent.REPLAY_PAGE);
					break;
				}
					
				case InstanceNames.BTN_CONTINUE:
				{
					dispatchWith(ApplicationEvent.PLAY);	
					break;
				}
					
				default:						
					break;
			}
		}
	}
}