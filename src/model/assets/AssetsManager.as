package model.assets
{
	import flash.filesystem.File;
	import flash.utils.Dictionary;
	
	import starling.events.EventDispatcher;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;
	
	/**
	 * THE CLASS IS REDUNDANT - REMOVE WHEN AssetsModel class BE READY
	 * */
	
	public class AssetsManager extends EventDispatcher
	{
		public static const PAGE_RESOURCES_LOADED:String = "PAGE_RESOURCES_LOADED";
		
		private static var _instance:AssetsManager;
		
		private var _assetManager:AssetManager
		private var _appDir:File;
		
		private var _bPageAtlasLoading:Boolean;
		private var _vPageToLoadNumbers:Vector.<uint>;
		private var _vLoadedPageNumbers:Vector.<uint>;
		private var _loadingPageNumber:uint;
		
		public function AssetsManager(enforcer:SingletonInforcer)
		{
			_assetManager = new AssetManager();
			_assetManager.verbose = true;
			
			_appDir = File.applicationDirectory;
			
			_vPageToLoadNumbers = new Vector.<uint>();
			_vLoadedPageNumbers = new Vector.<uint>();
		}
		
		public static function getInstance():AssetsManager
		{
			if (_instance == null)
			{
				_instance = new AssetsManager(new SingletonInforcer());
			}
			
			return _instance;
		}		
		
		public function enqueue(...parameters):void
		{
			_assetManager.enqueue(parameters);
		}
		
		public function loadQueue(onProgress:Function):void
		{
			_assetManager.loadQueue(onProgress);
		}
		
		// REMOVE /////////////////////////////////////////////////////////////////////////////
		// Function is redundant since getDOMDocumentXML & getSymbolXML functions
		public function getSettingsXMLByPageNumber(pageNumber:uint):XML
		{
			return _assetManager.getXml("settings_" + pageNumber);
		}
		///////////////////////////////////////////////////////////////////////////////////////
		
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
				_assetManager.enqueue(_appDir.resolvePath(_appDir.nativePath + "/../resources/page_" + pageNumber));
				_assetManager.loadQueue(pageResourcesLoadHandler);
			}
		}
		
		private function pageResourcesLoadHandler(percentLoaded:Number):void
		{
			if (percentLoaded == 1)
			{
				_vLoadedPageNumbers.push(_loadingPageNumber);
				dispatchEventWith(AssetsManager.PAGE_RESOURCES_LOADED, false, _loadingPageNumber);
				_bPageAtlasLoading = false;
				
				if (_vPageToLoadNumbers.length > 0)
				{
					loadPageResources(_vPageToLoadNumbers.shift());
				}
			}
		}		
		
	}
}

internal class SingletonInforcer{}