package
{
	import controls.IInputController;
	import controls.factory.BaseControlsFactory;
	import controls.factory.IControlsFactory;
	
	import events.ApplicationEvent;
	import events.ModelEvent;
	
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.geom.Point;
	
	import model.assets.Assets;
	import model.assets.AssetsModel;
	
	import org.robotlegs.starling.mvcs.Mediator;
	
	import pages.management.PagesView;
	
	import starling.events.Event;
	
	import states.ApplicationStatePaused;
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
			NativeApplication.nativeApplication.addEventListener(flash.events.Event.EXITING, applicationExitingHandler);
			
			addContextListener(ApplicationEvent.PLAY, play);
			addContextListener(ApplicationEvent.RESUME, resume);
			addContextListener(ApplicationEvent.PAUSE, pause);
			addContextListener(ApplicationEvent.LOCK, lock);
			addContextListener(ApplicationEvent.UNLOCK, unlock);
			addContextListener(ApplicationEvent.SLIDE, slide);
			addContextListener(ApplicationEvent.ZOOM, zoom);
			addContextListener(ApplicationEvent.MOVE, move);
			addContextListener(ApplicationEvent.MOVE_COMPLETE, moveComplete);
			addContextListener(ApplicationEvent.PLAY_COMPLETE, playComplete);
			
			statesFactory.setApplication(this);
			applyState(statesFactory.getStateLoading());		
		}		
				
		private function applicationExitingHandler(event:flash.events.Event):void
		{
			dispatchWith(ModelEvent.SAVE_LOCAL_DATA);
		}
		
		public function applyState(state:IApplicationState):void
		{			
			_state = null;
			_state = state;
			_state.execute();
		}
			
		//METHODS delegated to State /////////////////////////////////////////////		
		public function play(event:starling.events.Event):void
		{
			_state.play();				
		}
		
		public function resume(event:starling.events.Event):void
		{
			_state.resume();				
		}
		
		public function pause(event:starling.events.Event):void
		{
			_state.pause(event.data);
		}
		
		public function unlock(event:starling.events.Event):void
		{			
			_state.unlock();
		}
		
		public function lock(event:starling.events.Event):void
		{			
			_state.lock();
		}
		
		public function zoom(event:starling.events.Event):void
		{
			_state.zoom();
		}
		
		public function move(event:starling.events.Event):void
		{			
			_state.move(event.data as Point);
		}
		
		public function moveComplete(event:starling.events.Event):void
		{
			_state.moveComplete(event.data as Point);
		}
		
		public function playComplete(event:starling.events.Event):void
		{
			_state.playComplete();
		}
		
		//TODO: if the method is not required - refactor 
		public function slide(event:starling.events.Event):void
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
			view.initPauseMenu();
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
			addContextListener(ModelEvent.LOCAL_DATA_READY, localDataReadyHandler);
			dispatchWith(ModelEvent.GET_LOCAL_DATA);
		}
		
		private function localDataReadyHandler(event:starling.events.Event):void
		{
			removeContextListener(ModelEvent.LOCAL_DATA_READY, localDataReadyHandler);
			var pageNumber:uint = (event.data) ? event.data["currentPageNumber"] : 1;
			dispatchWith(ModelEvent.SHOW_PAGE, false, pageNumber);
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
		
		public function resumePlayback():void
		{
			dispatchWith(ModelEvent.RESUME_PLAYBACK);
		}
		
		public function stopPlayback():void
		{
			dispatchWith(ModelEvent.STOP_PLAYBACK);
		}
		
		public function pausePlayback():void
		{
			dispatchWith(ModelEvent.PAUSE_PLAYBACK);
		}
		
		public function zoomPlayback():void
		{
			dispatchWith(ModelEvent.ZOOM_PLAYBACK);
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
		
		public function movePage(offset:Point):void
		{
			dispatchWith(ModelEvent.MOVE_PAGE, false, offset);	
		}
		
		public function movePageComplete(offset:Point):void
		{
			dispatchWith(ModelEvent.MOVE_PAGE_COMPLETE, false, offset);
		}
		
		public function scrollPage(offset:Point):void
		{
			dispatchWith(ModelEvent.SCROLL_PAGE, false, offset);
		}
		
		public function scrollPageComplete(offset:Point):void
		{
			dispatchWith(ModelEvent.SCROLL_PAGE_COMPLETE, false, offset);
		}
		//////////////////////////////////////////////////////////////////////////		
	}
}