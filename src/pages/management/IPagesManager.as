package pages.management
{
	import data.PageDO;
	
	import pages.IPage;

	public interface IPagesManager
	{
		function showPageByNumber(pageNumber:uint):void;
		function switchPages(pageNumber:uint):void;
		function movePage(xOffset:Number):void;
		function resetPagePosition():void;
		function enable():void;
		function disable():void;
		function play():void;
		function pause():void;
		function stop():void;
		
		
		function getPageByNumber(pageNumber:uint):IPage;
		function setPageByNumber(pageNumber:uint, page:IPage):void;
		function getCurrentPage():IPage;
		
		function setPageData(pageData:PageDO):void;
		
		function get currentPageNumber():uint;
		function get intPagesCount():uint;
		function get loadingPageNumber():uint;
		function get containerPositionX():Number;
		function get temporaryContainerPositionX():Number;
		
		function set loadingPageNumber(number:uint):void;
		function set currentPageNumber(number:uint):void;
		function set containerPositionX(value:Number):void;
		function set temporaryContainerPositionX(value:Number):void;
	}
}