package application.states.autoplay
{
	import application.ApplicationMediator;
	import application.states.BaseAppState;
	import application.states.IAppStatesFactory;
	import application.states.manual.AppStateStart;

	public class AppStateStartAutoplay extends AppStateStart
	{
		public function AppStateStartAutoplay(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app,statesFactory);
		}
		
		override public function showPage(pageNumber:uint):void
		{
			_app.applyState(_statesFactory.getStateSwitchingPagesAutoplay());
			_app.showPage(pageNumber);
		}
	}
}