package pages.factory
{
	import data.PageDO;
	
	import pages.IPage;
	import pages.playback.IPlaybackStrategiesFactory;
	import pages.states.IPageState;

	public interface IPageBuilder
	{
		function createPage(/*data:PageDO*/):void;
		function initState():void;
		function initPlaybackStrategy():void;
		function initItemsFactory():void;
		function getPage():IPage;
	}
}