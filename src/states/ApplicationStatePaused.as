package states
{
	import events.ApplicationEvent;

	public class ApplicationStatePaused extends BaseApplicationState
	{
		public function ApplicationStatePaused(app:ApplicationMediator, statesFactory:IApplicationStatesFactory)
		{
			super(app,statesFactory);
		}
		
		override public function execute():void
		{
			_app.pausePlayback();
			_app.showLock();
		}
		
		override public function play():void
		{			
			_app.applyState(applicationStatesFactory.getStatePlaying());
		}
	}
}