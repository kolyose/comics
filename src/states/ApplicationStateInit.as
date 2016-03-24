package states
{
	import events.ApplicationEvent;

	public class ApplicationStateInit extends BaseApplicationState
	{		
		public function ApplicationStateInit(app:ApplicationMediator, statesFactory:IApplicationStatesFactory)
		{
			super(app,statesFactory);
		}
		
		override public function execute():void
		{
			_app.initView();			
			_app.applyState(applicationStatesFactory.getStateStart());
		}
	}
}