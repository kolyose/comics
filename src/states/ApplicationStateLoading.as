package states
{
	public class ApplicationStateLoading extends BaseApplicationState
	{
		public function ApplicationStateLoading(app:ApplicationMediator, statesFactory:IApplicationStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function execute():void
		{
			_app.loadAssets();
		}
		
		override public function lock():void
		{
			_app.disable();
			_app.showLock();
		}
		
		override public function unlock():void
		{
			_app.enable();
			_app.hideLock();
		}
	}
}