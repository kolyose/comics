package pages.management.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	public class EnablePagesManagerCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function EnablePagesManagerCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			pagesManager.enable();
		}
	}
}