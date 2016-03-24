package pages.items.factory
{
	import data.ItemDO;
	
	import pages.items.IItem;

	public interface IItemBuilder
	{
		function createItem(itemDO:ItemDO):void;
		function injectSubitemsFactory(factory:ISubitemFactory):void;
		function initItem():void;
		function getItem():IItem;
	}
}