package pages.items.factory
{
	import data.SubitemDO;
	
	import model.assets.AssetsModel;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import pages.items.ISubitem;

	public class BaseSubitemFactory extends Actor implements ISubitemFactory
	{
		[Inject]
		public var assetsModel:AssetsModel;
		
		protected var _builder:ISubitemBuilder;
		
		public function BaseSubitemFactory()
		{
		}
		
		public function getSubitem(subitemDO:SubitemDO):ISubitem
		{
			createSubitem(getBuilder(), subitemDO);
			return _builder.getSubitem();
		}
		
		protected function createSubitem(builder:ISubitemBuilder, subitemDO:SubitemDO):void
		{
			_builder = builder;	
			
			_builder.createSubitem(subitemDO);			
			_builder.initAssetsModel(assetsModel);
			_builder.initSubitem();
		}
		
		protected function getBuilder():ISubitemBuilder
		{
			return new BaseSubitemBuilder();
		}		
	}
}