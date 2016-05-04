package pages.playback
{
	import flash.geom.Point;
	
	import pages.IPage;
	import pages.management.vo.TweenPropertiesVO;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	
	public class ConsecutivePlaybackStrategyWithZoom extends ConsecutivePlaybackStrategy
	{
		protected var _isZoomed:Boolean;
		protected var _tween:Tween;
		protected var _tweenVO:TweenPropertiesVO;
		
		public function ConsecutivePlaybackStrategyWithZoom(page:IPage)
		{
			super(page);
		}
		
		override public function zoom(tweenVO:TweenPropertiesVO):void
		{
			_tweenVO = tweenVO;
			
			if (_isZoomed)
			{
				tweenToTargets(new Point(0,0), targetZoom);
			}
			else
			{
				var targetPoint:Point = new Point(-_vItems[_uintCurrentItemIndex].container.x, -_vItems[_uintCurrentItemIndex].container.y);
				var targetZoom:Number = 
					(_vItems[_uintCurrentItemIndex].container.width > _vItems[_uintCurrentItemIndex].container.height)
						? Math.floor(Settings.getInstance().WIDTH/_vItems[_uintCurrentItemIndex].container.width*10)/10
						: Math.floor(Settings.getInstance().HEIGHT/_vItems[_uintCurrentItemIndex].container.height*10)/10;
				
				tweenToTargets(targetPoint, targetZoom);
			}
			
			_isZoomed = !_isZoomed;
		}
		
		private function tweenToTargets(targetPoint:Point, targetZoom:Number):void
		{
			_tween = new Tween(_page.container, _tweenVO.speed, Transitions.LINEAR);
			_tween.moveTo(targetPoint.x, targetPoint.y);
			_tween.scaleTo(targetZoom);
			_tween.onComplete = _tweenVO.onCompleteHandler;
			
			Starling.juggler.add(_tween);	
		}
	}
}