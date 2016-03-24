package controls.commands
{
	import controls.IInputController;
	import controls.InputController;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import starling.events.EventDispatcher;
	
	public class EnableControlsCommand extends Command
	{
		[Inject]
		public var inputController:IInputController;
				
		public function EnableControlsCommand()
		{
			super();
		}
		
		override public function execute():void
		{			
			inputController.enable();
		}
	}
}