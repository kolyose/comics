package pages.management.commands
{
	import events.ApplicationEvent;
	import events.CommandEvent;
	import events.PagesEvent;
	import events.ViewEvent;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	import pages.management.vo.PagesContainerPositionTweenPropertiesVO;
	
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
			var tweenVO:PagesContainerPositionTweenPropertiesVO = new PagesContainerPositionTweenPropertiesVO();
			
			tweenVO.targetX = this.pagesManager.containerPosition.x;
			tweenVO.speed = Settings.getInstance().switchPagesSpeed;
			tweenVO.onCompleteHandler = resetPagePositionTweenCompleteHandler;
			
			dispatchWith(ViewEvent.CLEAR_PAGES_CONTAINER_POSITION_TWEEN);		
			dispatchWith(ViewEvent.TWEEN_PAGES_CONTAINER_POSITION, false, tweenVO);
		}
		
		private function resetPagePositionTweenCompleteHandler():void
		{			
			dispatchWith(ApplicationEvent.RESET_POSITION_COMPLETE);
		}
	}
}