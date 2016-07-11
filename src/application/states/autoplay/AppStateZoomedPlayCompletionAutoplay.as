package application.states.autoplay
{
	import application.ApplicationMediator;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import application.states.BaseAppState;
	import application.states.IAppStatesFactory;
	
	public class AppStateZoomedPlayCompletionAutoplay extends BaseAppState
	{
		private var _stateResetTimer:Timer;
		
		public function AppStateZoomedPlayCompletionAutoplay(app:ApplicationMediator, statesFactory:IAppStatesFactory)
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
			_app.playComplete();
		}
		
		override public function switchPages(pageNumber:uint):void
		{
			_app.applyState(_statesFactory.getStateSwitchingPagesZoomedAutoplay());
			_app.switchPagesAfterDelay(pageNumber);
		}		
		
		override public function theEnd():void
		{
			_app.applyState(_statesFactory.getStateMenuZoomedAutoplay());
		}
	}
}