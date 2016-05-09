package pages.states
{
	import data.PageDO;
	
	import pages.management.vo.TweenPropertiesVO;

	public interface IPageState
	{		
		function setData(data:PageDO):void;
		function play():void;
		function resume():void;
		function pause():void;
		function stop():void;
		function zoom(tweenVO:TweenPropertiesVO):void;
	}
}