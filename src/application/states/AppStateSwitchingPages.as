package application.states
{
	import flash.geom.Point;
	import application.ApplicationMediator;

	public class AppStateSwitchingPages extends BaseAppState
	{
		public function AppStateSwitchingPages(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
				
		override public function entry():void
		{
			_app.disable();
		}
		
		override public function exit():void
		{
			_app.enable();
		}		
		
		override public function switchPagesComplete():void
		{
			_app.switchPagesComplete();			
			_app.applyState(_statesFactory.getStateRunning());	
		}		
	}
}