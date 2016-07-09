package application.states.autoplay
{
	import application.ApplicationMediator;
	import application.states.BaseAppState;
	import application.states.IAppStatesFactory;
	
	import flash.geom.Point;

	public class AppStateMenuAutoplay extends BaseAppState
	{
		public function AppStateMenuAutoplay(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function entry():void
		{
			_app.disable();
			_app.pause();
			_app.showPauseMenu();
		}
		
		override public function exit():void
		{
			_app.enable();
			_app.hidePauseMenu();
		}
		
		override public function play():void
		{			
			_app.resetSubsequentPages();
			_app.applyState(_statesFactory.getStateRunningAutoplay());
		}
		
		override public function replay():void
		{		
			_app.resetPage();
			_app.resetSubsequentPages();
			_app.applyState(_statesFactory.getStateRunningAutoplay());
			_app.replay();
		}
		
		override public function showPage(pageNumber:uint):void
		{
			_app.resetPage(pageNumber);
			_app.resetSubsequentPages(pageNumber);
			_app.applyState(_statesFactory.getStateSwitchingPagesAutoplay());
			_app.showPage(pageNumber);
		}		
		
		override public function autoplay():void
		{
			_app.applyState(_statesFactory.getStateMenu());
		}		
	}
}