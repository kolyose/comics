package pages
{
	import data.ItemDO;
	import data.PageDO;
	
	import events.PlaybackEvent;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import pages.items.BaseItem;
	import pages.items.IItem;
	import pages.items.factory.IItemFactory;
	import pages.management.vo.TweenPropertiesVO;
	import pages.playback.BasePlaybackStrategy;
	import pages.playback.IPlaybackStrategy;
	import pages.states.IPageState;
	import pages.states.IPageStatesFactory;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class BasePage extends EventDispatcher implements IPage
	{
		protected var _itemsFactory:IItemFactory;
		
		protected var _data:PageDO;
		protected var _vItems:Vector.<IItem>;
		protected var _sprContainer:Sprite;
		
		protected var _playbackStrategy:IPlaybackStrategy;
		protected var _state:IPageState;
				
		public function BasePage()
		{			
			_sprContainer = new Sprite();			
		}
		
		public function applyState(newState:IPageState):void
		{
			_state = null;			
			_state = newState;
		}
		
		public function injectPlaybackStrategy(strategy:IPlaybackStrategy):void
		{
			_playbackStrategy = strategy;
		}
		
		public function injectItemsFactory(factory:IItemFactory):void
		{
			_itemsFactory = factory;	
		}
		
		public function activatePlayback():void
		{
			(_playbackStrategy as EventDispatcher).addEventListener(PlaybackEvent.PLAYBACK_COMPLETE, playbackCompleteHandler);
		}
		
		public function init(data:PageDO):void
		{
			_data = data;
			
			var itemData:ItemDO;
			var item:IItem;			
			var itemsCount:uint = _data.vItemsData.length;
			_vItems = new Vector.<IItem>(itemsCount, true);
			
			_sprContainer.removeChildren();
			
			for (var i:uint=0; i < itemsCount; i++)
			{
				itemData = _data.vItemsData[i];
				item = _itemsFactory.getItem(itemData);
				_vItems[i] = item;
				_sprContainer.addChild(item.container);
			}		
			
			_playbackStrategy.initItems(_vItems);
			_playbackStrategy.reset();
		}
		
		public function setData(data:PageDO):void
		{	
			_state.setData(data);
		}
		
		public function play():void
		{
			_state.play();
		}
		
		public function playComplete():void
		{
			_state.playComplete();
		}
		
		public function replay():void
		{
			_state.replay();
		}
		
		public function pause():void
		{
			_state.pause();
		}
				
		public function zoom(tweenVO:TweenPropertiesVO):void
		{
			_state.zoom(tweenVO);
		}
		
		public function restartPlayback():void
		{
			_playbackStrategy.restart();	
		}
		
		public function stopPlayback():void
		{
			_playbackStrategy.stop();
		}
		
		public function startPlayback():void
		{
			_playbackStrategy.start();
		}
		
		public function zoomPlayback(tweenVO:TweenPropertiesVO):void
		{
			_playbackStrategy.zoom(tweenVO);
		}
				
		public function dispatchPlaybackComplete():void
		{
			dispatchEventWith(PlaybackEvent.PLAYBACK_COMPLETE);	
		}
		
		protected function playbackCompleteHandler(event:Event):void
		{
			playComplete();			 
		}

		public function enable():void
		{
			_sprContainer.touchable = true;
		}
		
		public function disable():void
		{
			_sprContainer.touchable = false;
		}		

		public function get container():Sprite
		{
			return _sprContainer;
		}
		
		public function get items():Vector.<IItem>
		{
			return _vItems;
		}

		public function get state():IPageState
		{
			return _state;
		}		
		
		public function get data():PageDO
		{
			return _data;
		}
		
		public function set data(value:PageDO):void
		{
			_data = value;
		}
		
		
	}
}