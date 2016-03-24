package pages.items.factory
{
	import data.SubitemDO;
	
	import model.assets.AssetsModel;
	
	import pages.items.ISubitem;

	public interface ISubitemBuilder
	{
		function createSubitem(subitemDO:SubitemDO):void;		
		function initAssetsModel(model:AssetsModel):void;
		function initSubitem():void;
		function getSubitem():ISubitem;
	}
}