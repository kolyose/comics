package pages.management.commands
{
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	import pages.management.vo.TweenPropertiesVO;
	
	public class ZoomPlaybackCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
					
		public function ZoomPlaybackCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var tweenVO:TweenPropertiesVO = new TweenPropertiesVO();
			tweenVO.speed = Settings.getInstance().switchPagesSpeed;
			
			pagesManager.zoom(tweenVO);
		}
	}
}