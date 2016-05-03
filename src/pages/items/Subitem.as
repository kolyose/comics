package pages.items
{
	import data.SubitemDO;
	import data.SubitemStateDO;
	
	import model.assets.AssetsManager;
	import model.assets.AssetsModel;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Subitem extends EventDispatcher implements ISubitem
	{
		//TODO: integrate with robotlegs infrastructure & AssetsModel instead of AssetsManager
		
		public static const TYPE_SPRITE:String = "s";
		public static const TYPE_MOVIECLIP:String = "m";
		
		protected var _assetsModel:AssetsModel;
		
		protected var _subitemDO:SubitemDO;
		protected var _container:DisplayObject;
		protected var _bPlaybackStarted:Boolean;
		
		public function Subitem(subitemDO:SubitemDO)
		{
			_subitemDO = subitemDO;			
		}
		
		public function set state(subitemStateDO:SubitemStateDO):void
		{
			_container.x 		= subitemStateDO.matrix.tx;
			_container.y 		= subitemStateDO.matrix.ty;
			_container.scaleX 	= subitemStateDO.matrix.a;
			_container.scaleY 	= subitemStateDO.matrix.d;
			_container.alpha 	= subitemStateDO.alpha;
			
			if (_subitemDO.type == Subitem.TYPE_MOVIECLIP && !_bPlaybackStarted && _container.alpha > 0)
			{
				_bPlaybackStarted = true;
				Starling.juggler.add(_container as MovieClip);
				(_container as MovieClip).loop = false;
				(_container as MovieClip).play();				
			}
		}
		
		public function play():void
		{
			if (_subitemDO.type == Subitem.TYPE_MOVIECLIP && _bPlaybackStarted)
			{
				(_container as MovieClip).play();
			}
		}
		
		public function stop():void
		{
			if (_subitemDO.type == Subitem.TYPE_MOVIECLIP && _bPlaybackStarted)
			{
				(_container as MovieClip).pause();
			}
		}
		
		public function reset():void
		{
			if (_subitemDO.type == Subitem.TYPE_MOVIECLIP && _bPlaybackStarted)
			{
				_bPlaybackStarted = false;
				(_container as MovieClip).stop();
				Starling.juggler.remove(_container as MovieClip);
			}
		}
		
		public function get container():DisplayObject
		{
			return _container;
		}
		
		public function get ID():uint
		{
			return _subitemDO.ID;
		}
		
		public function injectAssetsModel(model:AssetsModel):void
		{
			_assetsModel = model;
		}
		
		public function init():void
		{
			_container = getContainerByType();			
		}
		
		private function getContainerByType():DisplayObject
		{
			var container:DisplayObject;
			
			switch(_subitemDO.type)
			{
				case TYPE_SPRITE:
				{
					container = new Sprite();
					(container as Sprite).addChild(new Image(_assetsModel.getAtlasByPageNumber(_subitemDO.pageNumber).getTexture(_subitemDO.name)));
					_bPlaybackStarted = true;
					break;
				}
					
				case TYPE_MOVIECLIP:
				{
					container = new MovieClip(_assetsModel.getAtlasByPageNumber(_subitemDO.pageNumber).getTextures(_subitemDO.name));
					break;
				}
					
				default:
				{
					break;
				}
			}
			
			return container;
		}
	}
}