package pages.management.commands
{
	import data.PageDO;
	
	import model.assets.AssetsModel;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.management.IPagesManager;
	
	import starling.events.Event;
	
	public class SetPageDataCommand extends Command
	{
		[Inject]
		public var event:Event;
		
		[Inject]
		public var assetsModel:AssetsModel;
		
		[Inject]
		public var pagesManager:IPagesManager;
		
		[Inject]
		public var xmlParser:XMLParser;
		
		public function SetPageDataCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var pageDO:PageDO = xmlParser.formPageData(assetsModel.getDOMDocumentXML());
			pageDO.setPageNumber(uint(event.data));		
			pagesManager.setPageData(pageDO);
		}
	}
}