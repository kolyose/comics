package application.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.IPage;
	import pages.management.IPagesManager;
	
	public class ResetZoomCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function ResetZoomCommand()
		{
			super();
		}
		
		override public function execute():void
		{			
			var totalPagesCount:uint = pagesManager.intPagesCount;
			for (var i:int=0; i < totalPagesCount; i++)
			{
				var page:IPage = pagesManager.getPageByNumber(i); 
				if (page)
					page.resetZoom();	
			}					
		}		
	}
}