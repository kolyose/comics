package pages.playback
{
	import flash.events.IEventDispatcher;
	
	import pages.items.IItem;
	import pages.management.vo.TweenPropertiesVO;

	public interface IPlaybackStrategy
	{
		function applyState(newState:IPlaybackStrategyState):void;
		function initItems(items:Vector.<IItem>):void;
		function start():void;
		function stop()	:void;
		function pause():void;
		function resume():void;
		function reset():void;
		function zoom(tweenVO:TweenPropertiesVO):void;
	}
}