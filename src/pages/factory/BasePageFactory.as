package pages.factory
{
	import data.PageDO;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import pages.IPage;
	
	public class BasePageFactory extends Actor implements IPageFactory
	{
		protected var _builder:IPageBuilder;
		
		public function BasePageFactory()
		{
		}
		
		public function getPage(/*data:PageDO*/):IPage
		{
			createPage(getBuilder()/*, data*/);
			return _builder.getPage();
		}		
		
		protected function createPage(builder:IPageBuilder/*, pageData:PageDO*/):void
		{
			_builder = builder;
			
			_builder.createPage(/*pageData*/);
			_builder.initState();
			_builder.initPlaybackStrategy();
			_builder.initItemsFactory();
		}		
		
		protected function getBuilder():IPageBuilder
		{
			return null;
		}
	}
}