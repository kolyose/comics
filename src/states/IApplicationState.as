package states
{
	import flash.geom.Point;

	public interface IApplicationState
	{		
		function execute():void;
		function play():void;
		function resume():void;
		function pause(showMenu:Boolean=false):void;
		function lock():void;
		function unlock():void;
		function slide():void;
		function zoom():void;
		function move(offset:Point):void;
		function moveComplete(offset:Point):void;
		function playComplete():void;
	}
}