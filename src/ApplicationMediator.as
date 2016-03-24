package
{
	import controls.IInputController;
	import controls.factory.BaseControlsFactory;
	import controls.factory.IControlsFactory;
	
	import events.ApplicationEvent;
	import events.ModelEvent;
	
	import model.assets.Assets;
	import model.assets.AssetsModel;
	
	import org.robotlegs.starling.mvcs.Mediator;
	
	import pages.management.PagesView;
	
	import starling.events.Event;
	
	import states.ApplicationStatesFactory;
	import states.IApplicationState;
	import states.IApplicationStatesFactory;
	
	public class ApplicationMediator extends Mediator
	{
		[Inject]
		public var view:ApplicationView;
		
		[Inject]
		public var assetsModel:AssetsModel;
		
		[Inject]
		public var inputController:IInputController;
		
		[Inject]
		public var controlsFactory:IControlsFactory;
		
		[Inject]
		public var statesFactory:IApplicationStatesFactory;
		
		private var _state:IApplicationState;
		
		public function ApplicationMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{			
			addContextListener(ApplicationEvent.PLAY, play);
			addContextListener(ApplicationEvent.PAUSE, pause);
			addContextListener(ApplicationEvent.LOCK, lock);
			addContextListener(ApplicationEvent.UNLOCK, unlock);
			addContextListener(ApplicationEvent.SLIDE, slide);
			
			statesFactory.setApplication(this);
			applyState(statesFactory.getStateLoading());		
		}		
				
		public function applyState(state:IApplicationState):void
		{
			_state = null;
			_state = state;
			_state.execute();
		}
			
		//METHODS delegated to State /////////////////////////////////////////////		
		public function play(event:Event):void
		{
			_state.play();				
		}
		
		public function pause(event:Event):void
		{
			_state.pause(event.data);
		}
		
		public function unlock(event:Event):void
		{			
			_state.unlock();
		}
		
		public function lock(event:Event):void
		{			
			_state.lock();
		}
		
		//TODO: if the method is not required - refactor 
		public function slide(event:Event):void
		{
			_state.slide();
		}
		//////////////////////////////////////////////////////////////////////////
		
		//METHODS specific to the Application ////////////////////////////////////
		public function loadAssets():void
		{
			assetsModel.enqueue(Assets);
			assetsModel.loadQueue(assetsLoadProgressHandler);	
		}
		
		protected function assetsLoadProgressHandler(numProgress:Number):void
		{
			if (numProgress == 1)
			{
				applyState(statesFactory.getStateInit());
			}
		}
		
		public function initView():void
		{
			view.init();
			view.initPagesView(new PagesView());
			view.initLockContainer(assetsModel.getTexture("touchContainer"));	
			view.initPauseMenu(assetsModel.getTexture("pauseMenuBg"), assetsModel.getTexture("replayButton"), assetsModel.getTexture("playButton"));
			view.hideLock();
			view.hidePauseMenu();
		}
		
		public function initControls():void
		{
			inputController.reset();
			inputController.injectControls(controlsFactory.getControls(view.getStage()));
			inputController.init();
		}		
		
		public function start():void
		{
			dispatchWith(ModelEvent.SHOW_PAGE, false, 1);
		}
				
		public function showLock():void
		{
			view.showLock();
		}
		
		public function hideLock():void
		{
			view.hideLock();
		}
		
		public function showPauseMenu():void
		{
			view.showPauseMenu();
		}
		
		public function hidePauseMenu():void
		{
			view.hidePauseMenu();
		}
		
		public function startPlayback():void
		{
			dispatchWith(ModelEvent.START_PLAYBACK);
		}
		
		public function stopPlayback():void
		{
			dispatchWith(ModelEvent.STOP_PLAYBACK);
		}
		
		public function pausePlayback():void
		{
			dispatchWith(ModelEvent.PAUSE_PLAYBACK);
		}
		
		public function enable():void
		{
			dispatchWith(ModelEvent.ENABLE_PAGES_MANAGER);			
			dispatchWith(ModelEvent.ENABLE_CONTROLS);
		}
		
		public function disable():void
		{
			dispatchWith(ModelEvent.DISABLE_PAGES_MANAGER);
			dispatchWith(ModelEvent.DISABLE_CONTROLS);
		}
		//////////////////////////////////////////////////////////////////////////		
	}
}