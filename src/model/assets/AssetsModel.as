package model.assets
{
	import events.ModelEvent;
	
	import flash.filesystem.File;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;
	
	public class AssetsModel extends Actor
	{
		private var _assetManager:AssetManager;
		private var _appDir:File;
		
		private var _bPageAtlasLoading:Boolean;
		private var _vPageToLoadNumbers:Vector.<uint>;
		private var _vLoadedPageNumbers:Vector.<uint>;
		private var _loadingPageNumber:uint;
		
		public function AssetsModel()
		{
			_assetManager = new AssetManager();
			_assetManager.verbose = true;
			
			_appDir = File.applicationDirectory;
			
			_vPageToLoadNumbers = new Vector.<uint>();
			_vLoadedPageNumbers = new Vector.<uint>();
		}
		
		public function enqueue(...parameters):void
		{
			_assetManager.enqueue(parameters);
		}
		
		public function loadQueue(onProgress:Function):void
		{
			_assetManager.loadQueue(onProgress);
		}
		
		public function getTexture(textureName:String):Texture
		{
			return _assetManager.getTexture(textureName);
		}
		
		public function getDOMDocumentXML():XML
		{
			return _assetManager.getXml("DOMDocument");
		}
		
		public function getSymbolXML(name:String):XML
		{
			return _assetManager.getXml(name);
		}
		
		public function getAtlasByPageNumber(pageNumber:uint):TextureAtlas
		{
			return _assetManager.getTextureAtlas("page_" + pageNumber);
		}
		
		public function loadPageResources(pageNumber:uint):void
		{			
			if (_bPageAtlasLoading)
			{
				_vPageToLoadNumbers.push(pageNumber);
			}
			else
			{
				_bPageAtlasLoading = true;
				_loadingPageNumber = pageNumber;
				var file:File = _appDir.resolvePath(_appDir.nativePath + "/../resources/page_" + pageNumber);
				_assetManager.enqueue(file);
				_assetManager.loadQueue(pageResourcesLoadHandler);
			}
		}
		
		private function pageResourcesLoadHandler(percentLoaded:Number):void
		{
			if (percentLoaded == 1)
			{
				_vLoadedPageNumbers.push(_loadingPageNumber);
				dispatchWith(ModelEvent.PAGE_RESOURCES_LOADED, false, _loadingPageNumber);
				_bPageAtlasLoading = false;
				
				if (_vPageToLoadNumbers.length > 0)
				{
					loadPageResources(_vPageToLoadNumbers.shift());
				}
			}
		}	
	}
}