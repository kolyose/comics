package pages.states
{
	import data.PageDO;

	public interface IPageState
	{		
		function setData(data:PageDO):void;
		function play():void;
		function pause():void;
		function stop():void;
	}
}