package pages.playback
{
	import events.PlaybackEvent;
	
	import pages.IPage;
	import pages.items.BaseItem;
	import pages.items.IItem;
	import pages.management.vo.TweenPropertiesVO;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.EventDispatcher;
	
	public class BasePlaybackStrategy extends EventDispatcher implements IPlaybackStrategy
	{
		protected var _page:IPage;
		protected var _sprContainer:Sprite;
		protected var _vItems:Vector.<IItem>;
		protected var _uintCurrentItemIndex:uint;
	//	protected var _state:IPlaybackStrategyState;
		protected var _playbackSpeed:uint;
		
		//TODO: remove states functionality if needless
		public function BasePlaybackStrategy(page:IPage, playbackSpeed:uint)
		{
			_page = page;
			_sprContainer = page.container;
			_playbackSpeed = playbackSpeed;
		}
		
		public function applyState(newState:IPlaybackStrategyState):void
		{
//			_state = null;			
	//		_state = newState;
		}
		
		public function initItems(items:Vector.<IItem>):void
		{			
			_vItems = items;
		}
		
		public function restart():void
		{
			reset();
			start();
		}
		
		public function stop():void
		{
			
		}
				
		public function start():void
		{
			
		}
		
		public function zoom(tweenVO:TweenPropertiesVO):void
		{
			
		}
		
		public function reset():void
		{
			for each (var item:IItem in _vItems)
			{
				item.reset();
			}
			
			_uintCurrentItemIndex = 0;
		}
		
		public function resetZoom():void{}
		
		public function updateSpeed(value:uint):void
		{
			_playbackSpeed = value;
		}
		
	}
}