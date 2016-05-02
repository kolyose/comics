package states
{
	public class ApplicationStateStart extends BaseApplicationState
	{
		public function ApplicationStateStart(app:ApplicationMediator, statesFactory:IApplicationStatesFactory)
		{
			super(app,statesFactory);
		}
		
		override public function execute():void
		{
			_app.start();
			_app.applyState(applicationStatesFactory.getStatePlaying());
			_app.startPlayback();
		}
		
		override public function lock():void
		{			
			
		}
		
		override public function unlock():void
		{
			_app.initControls();
		}
	}
}