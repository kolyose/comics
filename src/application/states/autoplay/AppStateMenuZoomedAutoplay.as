package application.states.autoplay
{
	import application.ApplicationMediator;
	import application.states.IAppStatesFactory;
	
	public class AppStateMenuZoomedAutoplay extends AppStateMenuAutoplay
	{
		public function AppStateMenuZoomedAutoplay(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function play():void
		{			
			_app.resetSubsequentPages();
			_app.applyState(_statesFactory.getStateRunningZoomedAutoplay());
		}
		
		override public function replay():void
		{		
			_app.resetPage();
			_app.resetSubsequentPages();
			_app.applyState(_statesFactory.getStateRunningZoomedAutoplay());
			_app.replay();
		}
		
		override public function showPage(pageNumber:uint):void
		{
			_app.resetPage(pageNumber);
			_app.resetSubsequentPages(pageNumber);
			_app.applyState(_statesFactory.getStateSwitchingPagesZoomedAutoplay());
			_app.showPage(pageNumber);
		}		
		
		override public function autoplay():void
		{
			_app.applyState(_statesFactory.getStateMenuZoomed());
		}
		
	}
}