package pages.management
{
	import data.PageDO;
	
	import flash.geom.Point;
	
	import pages.IPage;
	import pages.management.vo.TweenPropertiesVO;

	public interface IPagesManager
	{
	//	function showPageByNumber(pageNumber:uint):void;
		//function switchPages(pageNumber:uint):void;
		function movePage(xOffset:Number):void;
		//function resetPagePosition():void;
	//	function enable():void;
	//	function disable():void;
		function play():void;
		function replay():void;
		function pause():void;
		function zoom(tweenVO:TweenPropertiesVO):void;
		
		
		function getPageByNumber(pageNumber:uint):IPage;
		function setPageByNumber(pageNumber:uint, page:IPage):void;
		function getCurrentPage():IPage;
		
		function setPageData(pageData:PageDO):void;
		
		function get currentPageNumber():uint;
		function get intPagesCount():uint;
		function get loadingPageNumber():uint;
		function get containerPosition():Point;
		function get temporaryContainerPositionX():Number;
		
		function set loadingPageNumber(number:uint):void;
		function set currentPageNumber(number:uint):void;
		function set containerPosition(value:Point):void;
		function set temporaryContainerPositionX(value:Number):void;
	}
}