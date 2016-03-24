package states
{
	public interface IApplicationState
	{		
		function execute():void;
		function play():void;
		function pause(showMenu:Boolean=false):void;
		function lock():void;
		function unlock():void;
		function slide():void;
	}
}