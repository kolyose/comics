package pages.management.strategies
{
	import events.ModelEvent;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import pages.management.IPagesManager;
	import pages.management.vo.PagesContainerPositionTweenVO;

	public class SwitchPagesByContainerPositionTweening extends Actor implements ISwitchPagesStrategy
	{
		[Inject]
		public var pagesManager:IPagesManager;		
		
		private var _pageNumber:uint;
		private var _tweenVO:PagesContainerPositionTweenVO;
		
		public function SwitchPagesByContainerPositionTweening()
		{
		}
		
		public function switchToPageByNumber(pageNumber:uint):void
		{
			_pageNumber = pageNumber;
			_tweenVO = new PagesContainerPositionTweenVO();
			
			var intDirectionFactor:int = (pageNumber > pagesManager.currentPageNumber) ? -1 : 1;			
			var targetX:Number = pagesManager.containerPositionX + ((Settings.getInstance().WIDTH + Settings.getInstance().distanceBetweenPages) * intDirectionFactor);
						
			_tweenVO.targetX = targetX;
			_tweenVO.speed = Settings.getInstance().switchPagesSpeed;
			_tweenVO.onCompleteHandler = switchPagesCompleteHandler;
			
			dispatchWith(ModelEvent.TWEEN_PAGES_CONTAINER_POSITION, false, _tweenVO);
		}
		
		protected function switchPagesCompleteHandler():void
		{
			pagesManager.containerPositionX = _tweenVO.targetX;	
			pagesManager.currentPageNumber = _pageNumber;			
			
			dispatchWith(ModelEvent.SWITCH_PAGES_COMPLETE);			
		}
	}
}