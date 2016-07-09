package application.states.manual
{
	import application.ApplicationMediator;
	import application.states.BaseAppState;
	import application.states.IAppStatesFactory;

	public class AppStateStart extends BaseAppState
	{
		public function AppStateStart(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app,statesFactory);
		}
		
		override public function entry():void
		{			
						
		}
		
		override public function showPage(pageNumber:uint):void
		{
			_app.applyState(_statesFactory.getStateSwitchingPages());
			_app.showPage(pageNumber);
		}
	}
}