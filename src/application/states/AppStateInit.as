package application.states
{
	import events.ApplicationEvent;
	import application.ApplicationMediator;

	public class AppStateInit extends BaseAppState
	{		
		public function AppStateInit(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app,statesFactory);
		}
		
		override public function entry():void
		{
			_app.initView();			
			_app.applyState(_statesFactory.getStateStart());
		}
	}
}