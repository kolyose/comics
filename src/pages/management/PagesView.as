package pages.management
{	
	import pages.management.vo.PagesContainerPositionTweenPropertiesVO;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.textures.Texture;

	public class PagesView extends Sprite
	{		
		protected var _pagesContainer		:Sprite;
		protected var _backgroundContainer	:Sprite;
		protected var _movePageTween		:Tween;			
		
		public function PagesView()
		{
		}
		
		public function init():void
		{
			_pagesContainer = new Sprite();
			addChild(_pagesContainer);
		}
		
		public function reset():void
		{
		//	_pagesContainer.removeChildren(); //why do we need remove children?
			_pagesContainer.x = 0;
		}
		
		public function setPagesPosition(newPositionX:Number):void
		{
			_pagesContainer.x = newPositionX;
		}
		
		public function addPage(pageContainer:Sprite):void
		{
			_pagesContainer.addChild(pageContainer);
		}
		
		public function tweenPagesContainerPosition(vo:PagesContainerPositionTweenPropertiesVO):void
		{
			_movePageTween = new Tween(_pagesContainer, vo.speed, Transitions.EASE_OUT);
			_movePageTween.moveTo(vo.targetX, _pagesContainer.y);
			_movePageTween.onComplete = vo.onCompleteHandler;
			
			Starling.juggler.add(_movePageTween);		
		}
		
		public function clearPagesContainerPositionTween():void
		{
			Starling.juggler.remove(_movePageTween);
			_movePageTween = null;
		}
		
		public function movePagesContainer(xOffset:Number):void
		{
			_pagesContainer.x += xOffset;
		}		
	}
}