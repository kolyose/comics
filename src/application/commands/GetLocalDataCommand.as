package application.commands
{
	import events.CommandEvent;
	
	import flash.net.SharedObject;
	
	import org.robotlegs.starling.mvcs.Command;
	
	public class GetLocalDataCommand extends Command
	{
		public static var localData:SharedObject;
		
		public function GetLocalDataCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			if (!localData)
			{
				localData = SharedObject.getLocal("local");				
			}
			
			dispatchWith(CommandEvent.LOCAL_DATA_READY, false, localData.data);
		}
	}
}