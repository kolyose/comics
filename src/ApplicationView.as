package
{
	import flash.utils.setTimeout;
	
	import menu.PauseMenuView;
	
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.textures.Texture;
	
	public class ApplicationView extends Sprite
	{
		private var _context		:MainContext;
		private var _lockContainer	:Sprite;
		private var _pauseMenu		:PauseMenuView;
		
		public function ApplicationView()
		{
			_context = new MainContext(this);
		}
		
		public function init():void
		{
			
		}
		
		public function initPagesView(view:DisplayObject):void
		{
			addChild(view);
		}
		
		public function initLockContainer(container:Texture):void
		{
			_lockContainer = new Sprite();
			var image:Image = new Image(container);
			image.name = InstanceNames.LOCK_CONTAINER
			_lockContainer.addChild(image);
			addChild(_lockContainer);	
		}
				  
		public function initPauseMenu():void
		{		
			_pauseMenu = new PauseMenuView();
			addChild(_pauseMenu);
			_pauseMenu.x = (Settings.getInstance().WIDTH - _pauseMenu.width)/2;
			_pauseMenu.y = (Settings.getInstance().HEIGHT - _pauseMenu.height)/2;			
		}
		
		public function showLock():void
		{
			_lockContainer.alpha = .3;		
			_lockContainer.touchable = false;
		}
		
		public function hideLock():void
		{
			_lockContainer.alpha = 0;
			_lockContainer.touchable = true;
		}
				
		public function showPauseMenu():void
		{
			_pauseMenu.show();
		}
		
		public function hidePauseMenu():void
		{
			_pauseMenu.hide();
		}
		
		public function getStage():DisplayObject
		{
			return stage;
		}
	}
}