package pages.items
{
	import model.assets.AssetsModel;
	
	import starling.display.DisplayObject;

	public interface ISubitem
	{
		function injectAssetsModel(model:AssetsModel):void;
		function init():void;
		function reset():void;
		function get container():DisplayObject;
	}
}