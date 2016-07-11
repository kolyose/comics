package pages
{
	import data.PageDO;
	
	import pages.items.IItem;
	import pages.items.factory.IItemFactory;
	import pages.management.vo.TweenPropertiesVO;
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
		function playComplete():void;
		function replay():void;
		function pause():void;
		function reset():void;
		
		function zoom(tweenVO:TweenPropertiesVO):void;
		function zoomComplete():void;
		function zoomPlayback(tweenVO:TweenPropertiesVO):void;
		function dispatchZoomComplete():void;
		function resetZoom():void;
		
		function dispatchPlaybackComplete():void;
		function startPlayback():void;
		function stopPlayback():void;
		function restartPlayback():void;
		function resetPlayback():void;
		function updatePlaybackSpeed(value:uint):void;
		function enable():void;
		function disable():void;
	}
}