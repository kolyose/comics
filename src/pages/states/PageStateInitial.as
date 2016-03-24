package pages.states
{
	import data.PageDO;
	
	import pages.IPage;

	public class PageStateInitial extends BasePageState implements IPageState
	{
		public function PageStateInitial(page:IPage, statesFactory:IPageStatesFactory)
		{
			super(page, statesFactory);
		}
		
		override public function play():void
		{
			_page.applyState(pageStatesFactory.getStatePendingPlay(_page));
		}
		
		override public function setData(data:PageDO):void
		{
			_page.init(data);
			_page.applyState(pageStatesFactory.getStateReadyToPlay(_page));
		}
	}
}