package pages.items.factory
{
	import data.ItemDO;
	
	import pages.items.IItem;

	public interface IItemFactory
	{
		function getItem(itemDO:ItemDO):IItem;
	}
}