package pages.playback
{
	import events.PlaybackEvent;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import pages.IPage;
	import pages.items.BaseItem;
	import pages.items.IItem;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.filters.ColorMatrixFilter;
	
	public class ConsecutivePlaybackStrategy extends BasePlaybackStrategy
	{
		protected var _timer:Timer;
		protected var _colorMatrixFilter:ColorMatrixFilter;
		protected var _grayscaleFilterStepsCounter:uint;
		protected var _bPaused:Boolean;
		
		public function ConsecutivePlaybackStrategy(page:IPage)
		{
			super(page);
		}
				
		override public function start():void
		{
			super.start();
			initiateItemPlayback(_uintCurrentItemIndex);
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
		
		override public function pause():void
		{
			_bPaused = true;			
			stop();
		}
		
		override public function resume():void
		{
			_bPaused = false;
			
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
		
		override public function reset():void
		{					
			super.reset();
			deactivateTimer();
			
			_colorMatrixFilter = new ColorMatrixFilter();
			_colorMatrixFilter.adjustSaturation(-1);
			
			for each (var item:BaseItem in _vItems)
			{
				item.filter = _colorMatrixFilter;
			}	
			
			_grayscaleFilterStepsCounter = 0;
			_bPaused = false;
		}
		
		protected function initiateItemPlayback(itemIndex:uint):void
		{
			_uintCurrentItemIndex = itemIndex;
			activateTimer(Settings.getInstance().grayscaleFilterStepInterval, grayscaleTimerHandler);		
		}
		
		protected function grayscaleTimerHandler(event:TimerEvent):void
		{
			var item:BaseItem = _vItems[_uintCurrentItemIndex] as BaseItem;
			
			_colorMatrixFilter = new ColorMatrixFilter();
			_colorMatrixFilter.adjustSaturation(-1 + _grayscaleFilterStepsCounter * 1/Settings.getInstance().grayscaleFilterStepsNumber);
			item.filter = _colorMatrixFilter;
			
			_grayscaleFilterStepsCounter++;
			
			if (_grayscaleFilterStepsCounter == Settings.getInstance().grayscaleFilterStepsNumber)
			{
				_grayscaleFilterStepsCounter = 0;
				deactivateTimer(/*grayscaleTimerHandler*/);
				
				startItemPlayback(_uintCurrentItemIndex);
			}
		}
		
		protected function startItemPlayback(itemIndex:uint):void
		{
			if (!_bPaused)
			{			
				(_vItems[itemIndex] as BaseItem).addEventListener(PlaybackEvent.PLAYBACK_COMPLETE, itemPlaybackCompleteHandler);
				_sprContainer.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			}
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
				dispatchEventWith(PlaybackEvent.PLAYBACK_COMPLETE, true);
			}
		}
		
		protected function enterFrameHandler():void
		{
			_vItems[_uintCurrentItemIndex].nextFrame();
		}
		
		protected function playbackIntervalTimerHandler(event:TimerEvent):void
		{
			deactivateTimer(/*playbackIntervalTimerHandler*/);			
			initiateItemPlayback(_uintCurrentItemIndex);
		}
		
		protected function activateTimer(delay:Number, timerHandler:Function):void
		{			
			_timer = new Timer(delay);
			_timer.addEventListener(TimerEvent.TIMER, timerHandler, false, 0, true);
			_timer.start();
		}
		
		protected function deactivateTimer(/*timerHandler:Function*/):void
		{
			if (_timer)
			{
				_timer.stop();
				//_timer.removeEventListener(TimerEvent.TIMER, timerHandler);
				_timer = null;
			}
		}
	}
}