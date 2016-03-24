package controls.commands
{
	import controls.IInputController;
	import controls.InputController;
	
	import org.robotlegs.starling.mvcs.Command;
	
	public class DisableControlsCommand extends Command
	{
		[Inject]
		public var inputController:IInputController;
				
		public function DisableControlsCommand()
		{
			super();
		}
		
		override public function execute():void
		{			
			inputController.disable();
		}
		
	}
}