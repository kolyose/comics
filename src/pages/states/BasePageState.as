package pages.states
{
	import data.PageDO;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import pages.IPage;

	public class BasePageState /*extends Actor*/ implements IPageState
	{
		//[Inject]
		public var pageStatesFactory:IPageStatesFactory;
		
		protected var _page:IPage;
		
		public function BasePageState(page:IPage, statesFactory:IPageStatesFactory)
		{
			_page = page;
			pageStatesFactory = statesFactory;
		}
		
		public function setData(data:PageDO):void{}
		public function play():void{}		
		public function resume():void{}		
		public function pause():void{}
		public function stop():void{}
	}
}