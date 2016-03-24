package pages
{
	import data.PageDO;
	
	import pages.items.IItem;
	import pages.items.factory.IItemFactory;
	import pages.playback.IPlaybackStrategy;
	import pages.states.IPageState;
	
	import starling.display.Sprite;

	public interface IPage
	{
		function get container():Sprite;
		function get items():Vector.<IItem>;
		function get state():IPageState;
			
		function setData(pageDO:PageDO):void;
		function applyState(state:IPageState):void;	
		function injectPlaybackStrategy(strategy:IPlaybackStrategy):void;
		function activatePlayback():void
		function injectItemsFactory(factory:IItemFactory):void;
		function init(data:PageDO):void
		
		function play():void;
		function pause():void;
		function stop():void;
		function startPlayback():void;
		function pausePlayback():void;
		function stopPlayback():void;
		function resumePlayback():void;
		function enable():void;
		function disable():void;
	}
}