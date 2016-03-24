package
{
	import data.ItemDO;
	import data.PageDO;
	import data.SubitemDO;
	import data.SubitemStateDO;
	
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	import flash.xml.XMLNode;
	
	//import model.assets.AssetsManager;
	import model.assets.AssetsModel;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import pages.items.Subitem;

	public class XMLParser extends Actor
	{
		[Inject]
		public var assetsModel:AssetsModel;
		
		//TODO: integrate with robotlegs infrastructure & AssetsModel instead of AssetsManager
		
		namespace ns = "http://ns.adobe.com/xfl/2008/"				
		use namespace ns;
		
		//private static var _instance:XMLParser;
		
		public function XMLParser(/*enforcer:XMLParserSingletonInforcer*/)
		{
			
		}
		
		/*public static function getInstance():XMLParser
		{
			if (_instance == null)
			{
				_instance = new XMLParser(new XMLParserSingletonInforcer());
			}
			
			return _instance;
		}*/
		
		private function parseMatrix(xml:XML):Matrix
		{
			var matrix:Matrix = new Matrix();
			var xmlMatrix:XML = xml.matrix.Matrix[0];			
			
			if (xmlMatrix)
			{			
				matrix.a = (String(xmlMatrix.@a) != "") ? xmlMatrix.@a : matrix.a;
				matrix.b = (String(xmlMatrix.@b) != "") ? xmlMatrix.@b : matrix.b;
				matrix.c = (String(xmlMatrix.@c) != "") ? xmlMatrix.@c : matrix.c;
				matrix.d = (String(xmlMatrix.@d) != "") ? xmlMatrix.@d : matrix.d;
				matrix.tx = (String(xmlMatrix.@tx) != "") ? xmlMatrix.@tx : matrix.tx;
				matrix.ty = (String(xmlMatrix.@ty) != "") ? xmlMatrix.@ty : matrix.ty;
			}
			
			return matrix;
		}
		
		public function formPageData(xmlDOM:XML):PageDO
		{	
			var pageDO:PageDO = new PageDO();	
			pageDO.vItemsData = new Vector.<ItemDO>();
			
			// reading main DOMDocument
			var xmlListDOMSymbolInstances:XMLList = xmlDOM.timelines.DOMTimeline.layers.DOMLayer.frames.DOMFrame.elements.DOMSymbolInstance;
			
			//extracting items list and reading information about items
			for each (var DOMSymbolInstance:XML in xmlListDOMSymbolInstances)
			{
				var itemDO:ItemDO = new ItemDO();
				itemDO.name = String(DOMSymbolInstance.@libraryItemName).split("/")[1];				
				itemDO.matrix = parseMatrix(DOMSymbolInstance);
				itemDO.arrSubitemStatesPerFrame = [];
				itemDO.vSubitemsData = new Vector.<SubitemDO>();
				
				//reading item's XML
				var xmlSymbol:XML = assetsModel.getSymbolXML(itemDO.name);
				var xmlListLayers:XMLList = xmlSymbol.timeline.DOMTimeline.layers.DOMLayer;
				
				//moving through timeline layers/subitems (assuming each layer contains only one subitem)
				for each (var DOMLayer:XML in xmlListLayers)
				{
					var subitemDO:SubitemDO = null;
					var xmlListFrames:XMLList = DOMLayer.frames.DOMFrame;
					
					//moving through frames of current layer
					for (var DOMFrameIndex:int=0; DOMFrameIndex < xmlListFrames.length(); DOMFrameIndex++)
					{
						var subitemStateDO:SubitemStateDO = new SubitemStateDO();	
						var xmlDOMSymbolInstance:XML = xmlListFrames[DOMFrameIndex].elements.DOMSymbolInstance[0];
						
						//creating state of subitems per each frame
						if (xmlDOMSymbolInstance)
						{							
							subitemStateDO.name = String(xmlDOMSymbolInstance.@libraryItemName).split("/")[1];
							subitemStateDO.ID = itemDO.vSubitemsData.length;
							subitemStateDO.matrix = parseMatrix(xmlDOMSymbolInstance);
							
							// creating subitem data in the first frame
							if (!subitemDO)
							{
								subitemDO = new SubitemDO();
								subitemDO.name = subitemStateDO.name;								
								subitemDO.ID = subitemStateDO.ID;
								subitemDO.type = getSubitemTypeFromXML(assetsModel.getSymbolXML(subitemDO.name));
							}
							
							// RE-setting instanceName property in each frame (if the property exists)
							//TO DO: remember WHAT FOR?
							if (String(xmlDOMSymbolInstance.@name) != "")
							{
								subitemDO.instanceName = String(xmlDOMSymbolInstance.@name);
							}
							
							var xmlColor:XML = xmlDOMSymbolInstance.color.Color[0];
							if (xmlColor) subitemStateDO.alpha = Number(xmlColor.@alphaMultiplier);
							
							if (!itemDO.arrSubitemStatesPerFrame[DOMFrameIndex])
							{
								itemDO.arrSubitemStatesPerFrame[DOMFrameIndex] = new Vector.<SubitemStateDO>();
							}
							
							itemDO.arrSubitemStatesPerFrame[DOMFrameIndex].push(subitemStateDO);
						}						
					}	
					
					if (subitemDO)	itemDO.vSubitemsData.push(subitemDO);					
				}
				
				itemDO.vSubitemsData.reverse();
				
				pageDO.vItemsData.push(itemDO);
			}
			
			//pageDO.vItemsData.reverse();
			
			return pageDO;			
		}	
		
		private function getSubitemTypeFromXML(xmlSubitem:XML):String
		{
			var strSubitemType:String = Subitem.TYPE_SPRITE;
			
			var xmlListFrames:XMLList = xmlSubitem.timeline.DOMTimeline.layers.DOMLayer.frames.DOMFrame;
			
			if (xmlListFrames.length() > 1)
			{
				strSubitemType = Subitem.TYPE_MOVIECLIP;
			}
			
			return strSubitemType;
		}
		
		private function parseDOMDocumentXML(xmlDOM:XML):void
		{
			
		}
	}
}

//internal class XMLParserSingletonInforcer {}