package pages.management.commands
{
	import events.ModelEvent;
	import events.ViewEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	import pages.management.vo.PagesContainerPositionTweenVO;
	
	public class ResetPagesContainerPositionCommand extends Command
	{
		[Inject]
		public var pagesManager:IPagesManager;
		
		public function ResetPagesContainerPositionCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var tweenVO:PagesContainerPositionTweenVO = new PagesContainerPositionTweenVO();
			
			tweenVO.targetX = this.pagesManager.containerPositionX;
			tweenVO.speed = Settings.getInstance().switchPagesSpeed;
			tweenVO.onCompleteHandler = resetPagePositionTweenCompleteHandler;
			
			dispatchWith(ModelEvent.TWEEN_PAGES_CONTAINER_POSITION, false, tweenVO);
		}
		
		private function resetPagePositionTweenCompleteHandler():void
		{			
			dispatchWith(ModelEvent.PAGES_CONTAINER_POSITION_RESET_COMPLETE);
		}
	}
}