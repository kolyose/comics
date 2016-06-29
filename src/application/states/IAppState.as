package application.states
{
	import flash.geom.Point;

	public interface IAppState
	{				
		function entry():void;
		function exit():void;
		
		function play():void;
		function replay():void;
		function tap():void;
		function doubleTap():void;
		function move(offset:Point):void;
		function moveComplete(offset:Point):void;
		function playComplete():void;
		function zoomComplete():void;
		function switchPages(pageNumber:uint):void;
		function switchPagesComplete():void;
		function resetPosition():void;
		function resetPositionComplete():void;
		function showPage(pageNumber:uint):void;
		
	}
}