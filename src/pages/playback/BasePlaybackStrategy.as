package pages.playback
{
	import events.PlaybackEvent;
	
	import pages.IPage;
	import pages.items.BaseItem;
	import pages.items.IItem;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.EventDispatcher;
	
	public class BasePlaybackStrategy extends EventDispatcher implements IPlaybackStrategy
	{
		protected var _page:IPage;
		protected var _sprContainer:Sprite;
		protected var _vItems:Vector.<IItem>;
		protected var _uintCurrentItemIndex:uint;
				
		public function BasePlaybackStrategy(page:IPage)
		{
			_page = page;
			_sprContainer = page.container;
		}
		
		public function initItems(items:Vector.<IItem>):void
		{			
			_vItems = items;
		}
		
		public function start():void
		{
			reset();
		}
		
		public function stop():void
		{
			
		}
		
		public function pause():void
		{
		}
		
		public function resume():void
		{
			
		}
		
		public function zoom():void
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
	}
}