package pages.playback
{
	import flash.events.IEventDispatcher;
	
	import pages.items.IItem;
	import pages.management.vo.TweenPropertiesVO;

	public interface IPlaybackStrategy
	{
		function applyState(newState:IPlaybackStrategyState):void;
		function initItems(items:Vector.<IItem>):void;
		function restart():void;		
		function start():void;
		function stop():void;
		function reset():void;
		function zoom(tweenVO:TweenPropertiesVO):void;
	}
}