package application.commands
{
	import events.ApplicationEvent;
	
	import flash.geom.Point;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	import starling.events.Event;
	
	public class ScrollPageCompleteCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function ScrollPageCompleteCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			
		}
	}
}