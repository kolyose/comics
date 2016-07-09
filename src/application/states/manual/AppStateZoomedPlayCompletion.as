package application.states.manual
{
	import application.ApplicationMediator;
	import application.states.BaseAppState;
	import application.states.IAppStatesFactory;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class AppStateZoomedPlayCompletion extends BaseAppState
	{
		private var _stateResetTimer:Timer;
		
		public function AppStateZoomedPlayCompletion(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function entry():void
		{
			_app.disable();
			_app.zoom();
		}
		
		override public function exit():void
		{
			_app.enable();
		}
		
		override public function zoomComplete():void
		{
			_app.applyState(_statesFactory.getStateRunning());
		}		
		
	/*	override public function zoomComplete():void
		{	
			//starting timer for a case when PlayCompleteCommand won't initiate switching pages if an autoplay mode is disabled
			//in such case we need to switch current app state into normal flow with AppStateRunning
			_stateResetTimer = new Timer(1,1);
			_stateResetTimer.addEventListener(TimerEvent.TIMER_COMPLETE, stateResetTimerHandler);
			_stateResetTimer.start();
			
			_app.playComplete();			
		}		
				
		override public function switchPages(pageNumber:uint):void
		{
			//calling this method means the PlayCompleteCommand have initiated switching of pages due to autoplay mode enabled
			//so we're going to alternate flow with AppStateSwitchingPagesZoomed, which encapsulated a logic of switching between pages in zoomed mode
			//and we need no timer anymore
			resetTimer();
			_app.applyState(_statesFactory.getStateSwitchingPagesZoomed());
			_app.switchPages(pageNumber);
		}		
		
		private function stateResetTimerHandler(event:TimerEvent):void
		{
			//calling this method means the PlayCompleteCommand haven't initiated switching pages due to autoplay mode disabled
			//so we're going back to normal flow with AppStateRunning
			resetTimer();
			_app.applyState(_statesFactory.getStateRunning());
		}
		
		private function resetTimer():void
		{
			_stateResetTimer.stop();
			_stateResetTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, stateResetTimerHandler);
			_stateResetTimer = null;
		}*/
	}
}