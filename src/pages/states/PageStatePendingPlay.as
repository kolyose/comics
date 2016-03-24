package pages.states
{
	import data.PageDO;
	
	import pages.IPage;
	
	public class PageStatePendingPlay extends BasePageState
	{
		public function PageStatePendingPlay(page:IPage, statesFactory:IPageStatesFactory)
		{
			super(page, statesFactory);
		}
				
		override public function pause():void
		{
			_page.applyState(pageStatesFactory.getStateInitial(_page));
		}
		
		override public function stop():void
		{
			_page.applyState(pageStatesFactory.getStateInitial(_page));
		}
		
		override public function setData(data:PageDO):void
		{
			_page.init(data);
			_page.applyState(pageStatesFactory.getStateReadyToPlay(_page));
			_page.play();
		}
	}
}