package pages.playback.consecutive
{
	import events.PlaybackEvent;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import pages.IPage;
	import pages.items.BaseItem;
	import pages.items.IItem;
	import pages.playback.BasePlaybackStrategy;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.filters.ColorMatrixFilter;
	
	public class ConsecutivePlaybackStrategy extends BasePlaybackStrategy
	{
		protected var _timer:Timer;
		//protected var _colorMatrixFilter:ColorMatrixFilter;
		protected var _grayscaleFilterStepsCounter:uint;
		protected var _bPlaybackStarted:Boolean;
		protected var _bPlaybackComplete:Boolean;
		protected var _nextFrameSwitchCounter:uint;
		
		public function ConsecutivePlaybackStrategy(page:IPage, playbackSpeed:uint)
		{
			super(page, playbackSpeed);
		}
			
		override public function start():void
		{
			if (!_bPlaybackStarted)
			{
				_bPlaybackStarted = true;
				initiateItemPlayback(_uintCurrentItemIndex);
				return;
			}
			
			if (_timer)
			{
				_timer.start();
			}
			else
			{
				for each (var item:IItem in _vItems)
				{
					item.play();
				}
				
				startItemPlayback(_uintCurrentItemIndex);
			}
		}	
		
		override public function stop():void
		{
			if (_timer)
			{
				_timer.stop();
			}
			else
			{
				for each (var item:IItem in _vItems)
				{
					item.stop();
				}
				
				stopItemPlayback(_uintCurrentItemIndex);	
			}
		}
		
		override public function reset():void
		{					
			super.reset();
			deactivateTimer();
			
			for each (var item:BaseItem in _vItems)
			{
				clearItemFilter(item);
				
				var filter:ColorMatrixFilter = new ColorMatrixFilter();			
				filter.adjustSaturation(-1);
				item.filter = filter;
			}	
			
			_grayscaleFilterStepsCounter = 0;
			_nextFrameSwitchCounter = 0;
			_bPlaybackStarted = false;
			_bPlaybackComplete = false;
		}
		
		protected function initiateItemPlayback(itemIndex:uint):void
		{
			_uintCurrentItemIndex = itemIndex;
			activateTimer(Settings.getInstance().grayscaleFilterStepInterval, grayscaleTimerHandler);		
		}
		
		protected function grayscaleTimerHandler(event:TimerEvent):void
		{
			var item:BaseItem = _vItems[_uintCurrentItemIndex] as BaseItem;
			
			clearItemFilter(item);
			var filter:ColorMatrixFilter = new ColorMatrixFilter();			
			filter.adjustSaturation(-1 + _grayscaleFilterStepsCounter * 1/Settings.getInstance().grayscaleFilterStepsNumber);
			item.filter = filter;
			
			_grayscaleFilterStepsCounter++;
			
			if (_grayscaleFilterStepsCounter == Settings.getInstance().grayscaleFilterStepsNumber)
			{
				clearItemFilter(item);
				_grayscaleFilterStepsCounter = 0;
				deactivateTimer();
				
				startItemPlayback(_uintCurrentItemIndex);
			}
		}
		
		protected function startItemPlayback(itemIndex:uint):void
		{
			(_vItems[itemIndex] as BaseItem).addEventListener(PlaybackEvent.PLAYBACK_COMPLETE, itemPlaybackCompleteHandler);
			_sprContainer.addEventListener(Event.ENTER_FRAME, enterFrameHandler);			
		}
		
		protected function stopItemPlayback(itemIndex:uint):void
		{
			(_vItems[itemIndex] as BaseItem).removeEventListener(PlaybackEvent.PLAYBACK_COMPLETE, itemPlaybackCompleteHandler);
			_sprContainer.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		protected function itemPlaybackCompleteHandler():void
		{
			stopItemPlayback(_uintCurrentItemIndex);
			
			if (_uintCurrentItemIndex < _vItems.length-1)
			{
				_uintCurrentItemIndex++;
				activateTimer(Settings.getInstance().intervalBetweenItemsPlayback, playbackIntervalTimerHandler);
			}
			else
			{
				_bPlaybackComplete = true;
				dispatchEventWith(PlaybackEvent.PLAYBACK_COMPLETE);
			}
		}
		
		protected function enterFrameHandler():void
		{
			if (_nextFrameSwitchCounter >= Settings.getInstance().maxPlaybackSpeed - _playbackSpeed)
			{			
				_nextFrameSwitchCounter = 0;
				_vItems[_uintCurrentItemIndex].nextFrame();
			}
			else
			{
				_nextFrameSwitchCounter++;				
			}
		}
		
		protected function playbackIntervalTimerHandler(event:TimerEvent):void
		{
			deactivateTimer();			
			initiateItemPlayback(_uintCurrentItemIndex);
		}
		
		protected function activateTimer(delay:Number, timerHandler:Function):void
		{			
			_timer = new Timer(delay);
			_timer.addEventListener(TimerEvent.TIMER, timerHandler, false, 0, true);
			_timer.start();
		}
		
		protected function deactivateTimer():void
		{
			if (_timer)
			{
				_timer.stop();
				_timer = null;
			}
		}
		
		protected function clearItemFilter(item:BaseItem):void
		{
			if (item.filter)
			{
				item.filter.dispose();
				item.filter = null;
			}
		}
	}
}