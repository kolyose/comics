package pages.items.factory
{
	import data.ItemDO;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import pages.items.IItem;

	public class BaseItemFactory extends Actor implements IItemFactory
	{
		[Inject]
		public var subitemsFactory:ISubitemFactory;
		
		private var _builder:IItemBuilder;
		
		public function BaseItemFactory()
		{
		}
		
		public function getItem(itemDO:ItemDO):IItem
		{
			createItem(getBuilder(), itemDO);
			return _builder.getItem();
		}
				
		protected function createItem(builder:IItemBuilder, itemDO:ItemDO):void
		{
			_builder = builder;			
			_builder.createItem(itemDO);			
			_builder.injectSubitemsFactory(getSubitemsFactory());
			_builder.initItem();
		}
				
		protected function getBuilder():IItemBuilder
		{
			return new BaseItemBuilder();
		}
		
		protected function getSubitemsFactory():ISubitemFactory
		{
			//return new BaseSubitemFactory();
			return subitemsFactory;
		}
	}
}