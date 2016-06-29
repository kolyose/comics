package pages.playback.consecutive
{
	import events.PlaybackEvent;
	
	import flash.geom.Point;
	
	import pages.IPage;
	import pages.items.IItem;
	import pages.management.vo.TweenPropertiesVO;
	import pages.playback.IPlaybackStrategy;
	import pages.playback.consecutive.states.IConsecutivePlaybackStrategyWithZoomState;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.core.starling_internal;
	import starling.display.Sprite;
	
	public class ConsecutivePlaybackStrategyWithZoom extends ConsecutivePlaybackStrategy implements IPlaybackStrategy
	{
		private static const STATE_NO_ZOOM:uint = 0;
		private static const STATE_ZOOMING:uint = 1;
		private static const STATE_ZOOMED:uint = 2;
		
		protected var _state:uint;
		protected var _tween:Tween;
		protected var _tweenVO:TweenPropertiesVO;
		protected var _pageInitialCoordinates:Point;
		
		public function ConsecutivePlaybackStrategyWithZoom(page:IPage)
		{
			super(page);
		}
				
		override public function zoom(tweenVO:TweenPropertiesVO):void
		{
			_tweenVO = tweenVO;		
			
			//TODO: refactor in order to synchronize with Application states
			// Add ZoomCompleteCommand which will be calling zoomComplete method of Application states. The method will be responsible for switching between states
			// The command also should help to handle zoom + autoplay issue
			// Add new ApplicationStateZooming class which will contain empty zoom() method, so no other zooms be possible during the state
			
			switch(_state)
			{
				case STATE_ZOOMING:
				{
					return;
				}
					
				case STATE_ZOOMED:
				{
					tweenToInitial();
					break;
				}
					
				case STATE_NO_ZOOM:
				{
					_tweenVO.onCompleteHandler = function():void{_state = STATE_ZOOMED};
					var zoom:Number = getTargetZoom(_vItems[_uintCurrentItemIndex]);
					var targetPoint:Point = getTargetPoint(_vItems[_uintCurrentItemIndex], zoom);
					tweenToTargets(targetPoint, zoom, _tweenVO);
					break;
				}
				
				default:
					break;
			}			
		}	
		
		override public function stop():void
		{
			super.stop();
			
			if (_tween)
				Starling.juggler.remove(_tween);	
		}
		
		override public function start():void
		{
			super.start();
			
			if (_tween)
				Starling.juggler.add(_tween);	
		}
		
		override public function reset():void
		{					
			super.reset();
			resetZoom();
		}
		
		override protected function initiateItemPlayback(itemIndex:uint):void
		{
			if (_state == STATE_NO_ZOOM)
			{
				super.initiateItemPlayback(itemIndex);
				return;
			}
			
			_uintCurrentItemIndex = itemIndex;
			_tweenVO.onCompleteHandler = tweenToTargetsCompleteHandler;
			var zoom:Number = getTargetZoom(_vItems[_uintCurrentItemIndex]);
			tweenToTargets(getTargetPoint(_vItems[_uintCurrentItemIndex], zoom), zoom, _tweenVO);					
		}
				
		protected function tweenToTargetsCompleteHandler():void
		{
			activateTimer(Settings.getInstance().grayscaleFilterStepInterval, grayscaleTimerHandler);
			_tweenVO.onCompleteHandler = null;
			_state = STATE_ZOOMED;			
		}
		
		protected function getTargetPoint(targetItem:IItem, zoom:Number):Point
		{
			var point:Point = new Point(
				Math.round(_pageInitialCoordinates.x - targetItem.container.x * zoom), 
				Math.round(_pageInitialCoordinates.y - targetItem.container.y * zoom)
			);
			
			if (point.x < _pageInitialCoordinates.x - (Settings.getInstance().WIDTH * zoom - Settings.getInstance().WIDTH))
				point.x = _pageInitialCoordinates.x - (Settings.getInstance().WIDTH * zoom - Settings.getInstance().WIDTH);
			
			if (point.y < _pageInitialCoordinates.y - (Settings.getInstance().HEIGHT * zoom - Settings.getInstance().HEIGHT))
				point.y = _pageInitialCoordinates.y - (Settings.getInstance().HEIGHT * zoom - Settings.getInstance().HEIGHT);
					
			return point;
		}
		
		protected function getTargetZoom(targetItem:IItem):Number
		{
			var zoom:Number = (targetItem.container.width > targetItem.container.height)
				? Math.floor(Settings.getInstance().WIDTH / targetItem.container.width * 10) / 10
				: Math.floor(Settings.getInstance().HEIGHT / targetItem.container.height * 10) / 10;
			
			if (zoom > 2) zoom = 2;
			
			return zoom;
		}
		
		public function tweenToTargets(targetPoint:Point, targetZoom:Number, tweenVO:TweenPropertiesVO):void
		{
			_state = STATE_ZOOMING;
			
			if (_tween) _tween.reset(_page.container, tweenVO.speed, Transitions.LINEAR);
			else		_tween = new Tween(_page.container, tweenVO.speed, Transitions.LINEAR);
			
			_tween.moveTo(targetPoint.x, targetPoint.y);
			_tween.scaleTo(targetZoom);
			_tween.onComplete = tweenVO.onCompleteHandler;
			
			Starling.juggler.add(_tween);	
		}
		
		protected function tweenToInitial():void
		{
			_tweenVO.onCompleteHandler = resetZoom;
			tweenToTargets(_pageInitialCoordinates, 1, _tweenVO);
		}
		
		protected function removeTween():void
		{
			if (_tween)
			{
				Starling.juggler.remove(_tween);	
				_tween.onComplete = null;			
				_tween = null;
			}
		}
		
		protected function resetZoom():void
		{
			removeTween();
			_pageInitialCoordinates = new Point(_page.container.x, _page.container.y);
			_page.container.x = _pageInitialCoordinates.x;
			_page.container.y = _pageInitialCoordinates.y;
			_page.container.scaleX = _page.container.scaleY = 1;
			_state = STATE_NO_ZOOM;
		}
	}
}