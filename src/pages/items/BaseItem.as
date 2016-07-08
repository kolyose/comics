package pages.items
{
	import data.ItemDO;
	import data.SubitemDO;
	import data.SubitemStateDO;
	
	import events.PlaybackEvent;
	
	import flash.events.IEventDispatcher;
	
	import pages.items.factory.ISubitemFactory;
	
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
	import starling.filters.ColorMatrixFilter;
	import starling.filters.FragmentFilter;
	
	public class BaseItem extends EventDispatcher implements IItem
	{
		//TODO: integrate with robotlegs infrastructure & AssetsModel
		
		protected var _subitemsFactory:ISubitemFactory;
		
		protected var _itemDO:ItemDO;
		protected var _sprContainer:Sprite;
		protected var _vSubitems:Vector.<ISubitem>;
		protected var _uintCurrentFrame:uint;
		
		public function BaseItem(itemDO:ItemDO)
		{
			_itemDO = itemDO;			
			_sprContainer = new Sprite();
		}
		
		public function injectSubitemsFactory(factory:ISubitemFactory):void
		{
			_subitemsFactory = factory;
		}
		
		public function init():void
		{
			_sprContainer.x = _itemDO.matrix.tx;
			_sprContainer.y = _itemDO.matrix.ty;
			
			initializeSubitems();
			reset();
		}
		
		protected function initializeSubitems():void
		{
			var subitem:ISubitem;
			var dataLength:uint = _itemDO.vSubitemsData.length;			
			_vSubitems = new Vector.<ISubitem>(dataLength, true);
			
			for (var i:int=0; i < dataLength; i++)
			{
				//subitem = new Subitem(_itemDO.vSubitemsData[i]);
				subitem = _subitemsFactory.getSubitem(_itemDO.vSubitemsData[i]);
				_vSubitems[i] = subitem;
				_sprContainer.addChild(subitem.container);
			}			
		}
		
		protected function setSubitemsStateByFrame(frameNumber:uint):void
		{
			for each (var subitemStateDO:SubitemStateDO in _itemDO.arrSubitemStatesPerFrame[frameNumber])
			{
				for each (var subitem:Subitem in _vSubitems)
				{
					if (subitem.ID == subitemStateDO.ID)
					{
						subitem.state = subitemStateDO;						
						break;
					}
				}
			}
		}
		
		public function nextFrame():void
		{
			if (_uintCurrentFrame == _itemDO.arrSubitemStatesPerFrame.length-1)
			{
				dispatchEventWith(PlaybackEvent.PLAYBACK_COMPLETE);
			}
			else
			{
				_uintCurrentFrame++;
				setSubitemsStateByFrame(_uintCurrentFrame);
			}
			
		}
		
		public function play():void
		{
			for each (var subitem:Subitem in _vSubitems)
			{
				subitem.play();
			}
		}
		
		public function stop():void
		{
			for each (var subitem:Subitem in _vSubitems)
			{
				subitem.stop();
			}
		}
		
		public function reset():void
		{			
			for each (var subitem:Subitem in _vSubitems)
			{
				subitem.reset();
			}
			
			_uintCurrentFrame = 0;
			setSubitemsStateByFrame(_uintCurrentFrame);			
		}
		
		public function get container():Sprite
		{
			return _sprContainer;
		}
		
		public function set filter(filter:FragmentFilter):void
		{
			_sprContainer.filter = filter; 
		}
		
		public function get filter():FragmentFilter
		{
			return _sprContainer.filter; 
		}
	}
}