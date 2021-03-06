package pages.management.strategies
{
	import events.ApplicationEvent;
	import events.CommandEvent;
	import events.ViewEvent;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import pages.management.IPagesManager;
	import pages.management.vo.PagesContainerPositionTweenPropertiesVO;

	public class SwitchPagesByContainerPositionTweening extends Actor implements ISwitchPagesStrategy
	{
		[Inject]
		public var pagesManager:IPagesManager;		
		
		private var _pageNumber:uint;
		private var _tweenVO:PagesContainerPositionTweenPropertiesVO;
		
		public function SwitchPagesByContainerPositionTweening()
		{
		}
		
		public function switchToPageByNumber(pageNumber:uint):void
		{
			_pageNumber = pageNumber;
			_tweenVO = new PagesContainerPositionTweenPropertiesVO();
			
			var intDirectionFactor:int = (pageNumber > pagesManager.currentPageNumber) ? -1 : 1;			
			var targetX:Number = pagesManager.containerPosition.x + ((Settings.getInstance().WIDTH + Settings.getInstance().distanceBetweenPages) * intDirectionFactor);
						
			_tweenVO.targetX = targetX;
			_tweenVO.speed = Settings.getInstance().switchPagesSpeed;
			_tweenVO.onCompleteHandler = switchPagesCompleteHandler;
			
			dispatchWith(ViewEvent.CLEAR_PAGES_CONTAINER_POSITION_TWEEN);		
			dispatchWith(ViewEvent.TWEEN_PAGES_CONTAINER_POSITION, false, _tweenVO);
		}
		
		protected function switchPagesCompleteHandler():void
		{
			pagesManager.containerPosition.x = _tweenVO.targetX;	
			pagesManager.temporaryContainerPositionX = pagesManager.containerPosition.x;	
			pagesManager.currentPageNumber = _pageNumber;			
						
			dispatchWith(ApplicationEvent.SWITCH_PAGES_COMPLETE);			
		}
	}
}