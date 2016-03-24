package pages.items.factory
{
	import data.SubitemDO;
	
	import model.assets.AssetsModel;
	
	import pages.items.ISubitem;
	import pages.items.Subitem;

	public class BaseSubitemBuilder implements ISubitemBuilder
	{
		protected var _subitem:ISubitem;	
		
		public function BaseSubitemBuilder()
		{
		}
				
		public function createSubitem(subitemDO:SubitemDO):void
		{
			_subitem = new Subitem(subitemDO);
		}
		
		public function initAssetsModel(model:AssetsModel):void
		{
			_subitem.injectAssetsModel(model);
		}
		
		public function initSubitem():void
		{
			_subitem.init();
		}
		
		public function getSubitem():ISubitem
		{
			return _subitem;
		}
	}
}