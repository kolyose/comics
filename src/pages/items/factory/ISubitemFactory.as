package pages.items.factory
{
	import data.SubitemDO;
	
	import pages.items.ISubitem;

	public interface ISubitemFactory
	{
		function getSubitem(subitemDO:SubitemDO):ISubitem;
	}
}