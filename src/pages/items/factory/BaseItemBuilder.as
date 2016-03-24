package pages.items.factory
{
	import data.ItemDO;
	
	import pages.items.BaseItem;
	import pages.items.IItem;

	public class BaseItemBuilder implements IItemBuilder
	{
		protected var _item:IItem;		
		
		public function BaseItemBuilder()
		{
		}
		
		public function createItem(itemDO:ItemDO):void
		{
			_item = new BaseItem(itemDO);
		}
		
		public function injectSubitemsFactory(factory:ISubitemFactory):void
		{
			_item.injectSubitemsFactory(factory);
		}
		
		public function initItem():void
		{
			_item.init();
		}
		
		public function getItem():IItem
		{
			return _item;
		}
	}
}