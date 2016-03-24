package pages.factory
{
	import data.PageDO;
	
	import pages.IPage;

	public interface IPageFactory
	{
		function getPage(/*ata:PageDO*/):IPage;
		//function createPage(builder:IPageBuilder/*, pageData:PageDO*/):void;		
		//function getBuilder():IPageBuilder;
	}
}