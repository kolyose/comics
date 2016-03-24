package pages.management.commands
{
	import events.ModelEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import starling.events.Event;
	
	public class AddNeighbourPagesCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		public function AddNeighbourPagesCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var pageNumber:uint = uint(event.data);
			
			for (var i:int=1; i <= Settings.getInstance().neighbourPagesNumber; i++)
			{
				dispatchWith(ModelEvent.ADD_PAGE, false, pageNumber+i);
				dispatchWith(ModelEvent.ADD_PAGE, false, pageNumber-i);
			}			
		}
	}
}