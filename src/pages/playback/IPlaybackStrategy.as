package pages.playback
{
	import flash.events.IEventDispatcher;
	
	import pages.items.IItem;

	public interface IPlaybackStrategy
	{
		function initItems(items:Vector.<IItem>):void;
		function start():void;
		function stop()	:void;
		function pause():void;
		function resume():void;
		function reset():void;
		function zoom():void;
	}
}