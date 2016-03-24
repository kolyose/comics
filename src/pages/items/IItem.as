package pages.items
{
	import flash.events.IEventDispatcher;
	
	import pages.items.factory.ISubitemFactory;
	
	import starling.display.Sprite;

	public interface IItem
	{
		function injectSubitemsFactory(factory:ISubitemFactory):void;
		function init():void;
		function get container():Sprite;	
		function nextFrame():void;
		function play():void;
		function stop():void;
		function reset():void;
	}
}