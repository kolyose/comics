package application.states
{
	import application.ApplicationMediator;

	public class AppStateLoading extends BaseAppState
	{
		public function AppStateLoading(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function entry():void
		{
			_app.loadAssets();
		}		
	}
}