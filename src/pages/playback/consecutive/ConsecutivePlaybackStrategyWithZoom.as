package pages.playback.consecutive
{
	import events.PlaybackEvent;
	
	import flash.geom.Point;
	
	import pages.IPage;
	import pages.items.IItem;
	import pages.management.vo.TweenPropertiesVO;
	import pages.playback.IPlaybackStrategy;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.core.starling_internal;
	import starling.display.Sprite;
	
	//TODO: REFACTOR the Strategy as an Actor
	public class ConsecutivePlaybackStrategyWithZoom extends ConsecutivePlaybackStrategy implements IPlaybackStrategy
	{	
		protected var _zoomed:Boolean;
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
			
			if (!_pageInitialCoordinates)
				_pageInitialCoordinates = new Point(_page.container.x, _page.container.y);
					
			if (_zoomed)
			{
				 
				_tweenVO.onCompleteHandler = function():void
				{
					_tweenVO.onCompleteHandler = null;
					_zoomed = false;					
					dispatchEventWith(PlaybackEvent.ZOOM_COMPLETE);					
				}
				tweenToTargets(_pageInitialCoordinates, 1, _tweenVO);
			}
			else
			{
				_tweenVO.onCompleteHandler = function():void
				{
					_tweenVO.onCompleteHandler = null;
					_zoomed = true;
					dispatchEventWith(PlaybackEvent.ZOOM_COMPLETE);
				}				
				var zoom:Number = getTargetZoom(_vItems[_uintCurrentItemIndex]);
				var targetPoint:Point = getTargetPoint(_vItems[_uintCurrentItemIndex], zoom);
				tweenToTargets(targetPoint, zoom, _tweenVO);
			}
		}
		
		override public function start():void
		{
			if (!_pageInitialCoordinates)
				_pageInitialCoordinates = new Point(_page.container.x, _page.container.y);
			
			super.start();
		}
		
		override public function stop():void
		{
			super.stop();
			
			if (_tween)
				Starling.juggler.remove(_tween);	
		}
		
		override public function reset():void
		{
			super.reset();
			removeTween();
		}
		
		override protected function initiateItemPlayback(itemIndex:uint):void
		{
			super.initiateItemPlayback(itemIndex);
			if (!_zoomed) return;
			
			var zoom:Number = getTargetZoom(_vItems[_uintCurrentItemIndex]);
			tweenToTargets(getTargetPoint(_vItems[_uintCurrentItemIndex], zoom), zoom, _tweenVO);		
		}
		
		protected function tweenToTargetsCompleteHandler():void
		{
			activateTimer(Settings.getInstance().grayscaleFilterStepInterval, grayscaleTimerHandler);
		}
		
		protected function getTargetPoint(targetItem:IItem, zoom:Number):Point
		{
			var point:Point = new Point(
				Math.round(_pageInitialCoordinates.x - targetItem.container.x * zoom), 
				Math.round(_pageInitialCoordinates.y - targetItem.container.y * zoom)
			);
			
			if (point.x < _pageInitialCoordinates.x - (Settings.getInstance().WIDTH * zoom - Settings.getInstance().WIDTH))
			{
				point.x = _pageInitialCoordinates.x - (Settings.getInstance().WIDTH * zoom - Settings.getInstance().WIDTH);
			}
				
			if (point.y < _pageInitialCoordinates.y - (Settings.getInstance().HEIGHT * zoom - Settings.getInstance().HEIGHT))
			{				
				point.y = _pageInitialCoordinates.y - (Settings.getInstance().HEIGHT * zoom - Settings.getInstance().HEIGHT);
			}
					
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
			if (_tween) _tween.reset(_page.container, tweenVO.speed, Transitions.LINEAR);
			else		_tween = new Tween(_page.container, tweenVO.speed, Transitions.LINEAR);
				
			_tween.moveTo(targetPoint.x, targetPoint.y);
			_tween.scaleTo(targetZoom);
			_tween.onComplete = tweenVO.onCompleteHandler;
			
			Starling.juggler.add(_tween);	
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
		
		override public function resetZoom():void
		{
			removeTween();
			
			if (!_pageInitialCoordinates)
				_pageInitialCoordinates = new Point(_page.container.x, _page.container.y);
						
			_page.container.x = _pageInitialCoordinates.x;
			_page.container.y = _pageInitialCoordinates.y;
			_page.container.scaleX = _page.container.scaleY = 1;
			_zoomed = false;
		}
	}
}