package application.states
{
	import application.ApplicationMediator;

	public class AppStateStart extends BaseAppState
	{
		public function AppStateStart(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app,statesFactory);
		}
		
		override public function entry():void
		{			
			_app.initControls();
			_app.start();						
		}
		
		override public function showPage(pageNumber:uint):void
		{
			_app.applyState(_statesFactory.getStateSwitchingPages());
			_app.showPage(pageNumber);
		}
	}
}