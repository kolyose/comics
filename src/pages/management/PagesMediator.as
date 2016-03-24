package pages.management
{
	import events.ModelEvent;
	import events.ViewEvent;
	
	import org.robotlegs.starling.mvcs.Mediator;
	
	import pages.management.vo.PagesContainerPositionTweenVO;
	
	import starling.display.Sprite;
	import starling.events.Event;

	public class PagesMediator extends Mediator
	{
		[Inject]
		public var view:PagesView;
		
		public function PagesMediator()
		{
		}
		
		override public function onRegister():void
		{
			addContextListener(ViewEvent.RESET_PAGES_VIEW, resetViewHandler);
			addContextListener(ViewEvent.SET_PAGES_POSITION, setPagesPositionHandler);
			addContextListener(ViewEvent.ADD_PAGE, addPageHandler);
			addContextListener(ViewEvent.TWEEN_PAGES_CONTAINER_POSITION, tweenPagesContainerPositionHandler);
			addContextListener(ViewEvent.CLEAR_PAGES_CONTAINER_POSITION_TWEEN, clearPagesContainerPositionTweenHandler);
			addContextListener(ViewEvent.MOVE_PAGES_CONTAINER, movePagesContainerHandler);
			
			view.init();
		}
		
		private function movePagesContainerHandler(event:Event):void
		{
			view.movePagesContainer(Number(event.data));	
		}
		
		private function resetViewHandler(event:Event):void
		{
			view.reset();
		}
		
		private function setPagesPositionHandler(event:Event, newPagesPosition:Number):void
		{
			view.setPagesPosition(newPagesPosition);
		}
		
		private function addPageHandler(event:Event):void
		{
			view.addPage(event.data as Sprite);
		}
		
		private function tweenPagesContainerPositionHandler(event:Event):void
		{
			view.tweenPagesContainerPosition(event.data as PagesContainerPositionTweenVO);
		}
		
		private function clearPagesContainerPositionTweenHandler(event:Event):void
		{
			view.clearPagesContainerPositionTween();	
		}
	}
}