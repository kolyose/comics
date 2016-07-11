package application
{
	import application.states.IAppState;
	import application.states.IAppStatesFactory;
	
	import controls.IInputController;
	import controls.factory.BaseControlsFactory;
	import controls.factory.IControlsFactory;
	
	import events.ApplicationEvent;
	import events.CommandEvent;
	import events.ModelEvent;
	
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	import model.assets.Assets;
	import model.assets.AssetsModel;
	
	import org.robotlegs.starling.mvcs.Mediator;
	
	import pages.management.PagesView;
	
	import starling.events.Event;
	
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
		public var statesFactory:IAppStatesFactory;
		
		[Inject]
		public var playbackSettings:IPlaybackSettings;
		
		private var _state:IAppState;
		private var _startFromPageNumber:uint;
		private var _delayTimer:Timer;
		private var _pageNumberSwitchTo:uint;
		
		public function ApplicationMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{			
			NativeApplication.nativeApplication.addEventListener(flash.events.Event.EXITING, applicationExitingHandler);
			
			addContextListener(ApplicationEvent.TAP, tapHandler);
			addContextListener(ApplicationEvent.DOUBLE_TAP, doubleTapHandler);			
			
			addContextListener(ApplicationEvent.MOVE, moveHandler);
			addContextListener(ApplicationEvent.MOVE_COMPLETE, moveCompleteHandler);
			
			addContextListener(ApplicationEvent.PLAY, playHandler);
			addContextListener(ApplicationEvent.REPLAY, replayHandler);
			addContextListener(ApplicationEvent.PLAY_COMPLETE, playCompleteHandler);
			
			addContextListener(ApplicationEvent.SWITCH_PAGES, switchPagesHandler);
			addContextListener(ApplicationEvent.SWITCH_PAGES_COMPLETE, switchPagesCompleteHandler);
			
			addContextListener(ApplicationEvent.RESET_POSITION, resetPositionHandler);
			addContextListener(ApplicationEvent.RESET_POSITION_COMPLETE, resetPositionCompleteHandler);
						
			addContextListener(ApplicationEvent.ZOOM, zoomHandler);
			addContextListener(ApplicationEvent.ZOOM_COMPLETE, zoomCompleteHandler);
			
			addContextListener(ApplicationEvent.SHOW_PAGE, showPageHandler);			
			addContextListener(ApplicationEvent.AUTOPLAY, autoplayHandler);
			addContextListener(ApplicationEvent.THE_END, theEndHandler);
			
			statesFactory.setApplication(this);
			applyState(statesFactory.getStateLoading());		
		}		
				
		private function applicationExitingHandler(event:flash.events.Event):void
		{
			dispatchWith(CommandEvent.SAVE_LOCAL_DATA);
		}
		
		public function applyState(state:IAppState):void
		{		
			if (_state)
				_state.exit();
			
			_state = state;
			_state.entry();
			trace(_state);
		}
			
		//METHODS delegated to State /////////////////////////////////////////////	
		private function playHandler(event:starling.events.Event):void
		{			
			_state.play();
		}
		
		private function replayHandler(event:starling.events.Event):void
		{			
			_state.replay();
		}
		
		private function tapHandler(event:starling.events.Event):void
		{			
			_state.tap();
		}
		
		private function doubleTapHandler(event:starling.events.Event):void
		{			
			_state.zoom();
		}
		
		private function zoomHandler(event:starling.events.Event):void
		{			
			_state.zoom();
		}
		
		private function zoomCompleteHandler(event:starling.events.Event):void
		{			
			_state.zoomComplete();
		}	
		
		private function moveHandler(event:starling.events.Event):void
		{			
			_state.move(event.data as Point);
		}
		
		private function moveCompleteHandler(event:starling.events.Event):void
		{
			_state.moveComplete(event.data as Point);
		}
		
		private function playCompleteHandler(event:starling.events.Event):void
		{
			_state.playComplete();
		}	
		
		private function switchPagesHandler(event:starling.events.Event):void
		{
			_state.switchPages(event.data as uint);
		}
		
		private function switchPagesCompleteHandler(event:starling.events.Event):void
		{
			_state.switchPagesComplete();
		}	
		
		private function resetPositionHandler(event:starling.events.Event):void
		{
			_state.resetPosition();
		}
		
		private function resetPositionCompleteHandler(event:starling.events.Event):void
		{
			_state.resetPositionComplete();
		}	
		
		private function showPageHandler(event:starling.events.Event):void
		{
			_state.showPage(event.data as uint);
		}
		
		private function autoplayHandler(event:starling.events.Event):void
		{
			_state.autoplay();
		}
		
		private function theEndHandler(event:starling.events.Event):void
		{
			_state.theEnd();
		}
		//////////////////////////////////////////////////////////////////////////
		
		//METHODS specific to the Application ////////////////////////////////////
		public function loadAssets():void
		{
			//assetsModel.enqueue(Assets);
			//assetsModel.loadQueue(assetsLoadProgressHandler);	
			
			addContextListener(ModelEvent.COMMON_ASSETS_LOADED, assetsLoadedHandler);
			assetsModel.loadCommonAssets();
		}
		
		protected function assetsLoadedHandler(event:starling.events.Event):void
		{
			loadLocalData();
		}
		
		protected function assetsLoadProgressHandler(numProgress:Number):void
		{
			if (numProgress == 1)
			{
				loadLocalData();
			}
		}
		
		public function loadLocalData():void
		{
			addContextListener(CommandEvent.LOCAL_DATA_READY, localDataReadyHandler);
			dispatchWith(CommandEvent.GET_LOCAL_DATA);
		}
		
		private function localDataReadyHandler(event:starling.events.Event):void
		{
			removeContextListener(CommandEvent.LOCAL_DATA_READY, localDataReadyHandler);
			
			playbackSettings.autoplayModeEnabled = (event.data && event.data["autoplayModeEnabled"] != undefined) ? 
				event.data["autoplayModeEnabled"] : playbackSettings.autoplayModeEnabled;
			
			playbackSettings.playbackSpeed = (event.data && event.data["playbackSpeed"] != undefined) ? 
				event.data["playbackSpeed"] : playbackSettings.playbackSpeed;
			
			_startFromPageNumber = (event.data && event.data["currentPageNumber"] != undefined) ? event.data["currentPageNumber"] : 1;
			
			applyState(statesFactory.getStateInit());
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
			if (playbackSettings.autoplayModeEnabled)
				applyState(statesFactory.getStateStartAutoplay());
			else 
				applyState(statesFactory.getStateStart());
			
			dispatchWith(ApplicationEvent.SHOW_PAGE, false, _startFromPageNumber); //event to itself
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
		
		public function play():void
		{
			dispatchWith(CommandEvent.PLAY);
		}
		
		public function playComplete():void
		{
			dispatchWith(CommandEvent.PLAY_COMPLETE);
		}
		
		public function replay():void
		{
			dispatchWith(CommandEvent.REPLAY);
		}
		
		public function pause():void
		{
			dispatchWith(CommandEvent.PAUSE);
		}
		
		public function zoom():void
		{
			dispatchWith(CommandEvent.ZOOM_PLAYBACK);
		}
		
		public function move(offset:Point):void
		{
			dispatchWith(CommandEvent.MOVE_PAGE, false, offset);	
		}
		
		public function moveComplete(offset:Point):void
		{
			dispatchWith(CommandEvent.MOVE_PAGE_COMPLETE, false, offset);
		}
		
		public function scroll(offset:Point):void
		{
			dispatchWith(CommandEvent.SCROLL_PAGE, false, offset);
		}
		
		public function scrollComplete(offset:Point):void
		{
			dispatchWith(CommandEvent.SCROLL_PAGE_COMPLETE, false, offset);
		}
		
		public function switchPages(pageNumber:uint):void
		{
			dispatchWith(CommandEvent.SWITCH_PAGES, false, pageNumber);
		}
		
		public function switchPagesAfterDelay(pageNumber:uint):void
		{
			_pageNumberSwitchTo = pageNumber;
			
			_delayTimer = new Timer(1000 * (Settings.getInstance().maxPlaybackSpeed - playbackSettings.playbackSpeed), 1);
			_delayTimer.addEventListener(TimerEvent.TIMER_COMPLETE, delayTimerHandler);
			_delayTimer.start();
		}
		
		private function delayTimerHandler(event:TimerEvent):void
		{
			_delayTimer.stop();
			_delayTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, delayTimerHandler);
			_delayTimer = null;	
			
			switchPages(_pageNumberSwitchTo);
		}
		
		public function switchPagesComplete():void
		{
			dispatchWith(CommandEvent.SWITCH_PAGES_COMPLETE);
		}
		
		public function enable():void
		{
			dispatchWith(CommandEvent.SET_PAGE_ENABLED, false, true);		
			dispatchWith(CommandEvent.ENABLE_CONTROLS);
		}
		
		public function disable():void
		{
			dispatchWith(CommandEvent.SET_PAGE_ENABLED, false, false);
			dispatchWith(CommandEvent.DISABLE_CONTROLS);
		}
		
		public function resetPosition():void
		{
			dispatchWith(CommandEvent.RESET_PAGES_POSITION);
		}
		
		public function showPage(pageNumber:uint):void
		{
			dispatchWith(CommandEvent.SHOW_PAGE, false, pageNumber);
		}
		
		public function resetPage(pageNumber:int=-1):void
		{
			dispatchWith(CommandEvent.RESET_PAGE, false, pageNumber);
		}
		
		public function resetSubsequentPages(pageNumber:int=-1):void
		{
			dispatchWith(CommandEvent.RESET_SUBSEQUENT_PAGES, false, pageNumber);
		}
		
		public function resetZoom():void
		{
			dispatchWith(CommandEvent.RESET_ZOOM);
		}
		//////////////////////////////////////////////////////////////////////////		
	}
}