package application.states
{
	import application.ApplicationMediator;
	
	public class AppStateSwitchingPagesZoomed extends AppStateSwitchingPages
	{
		public function AppStateSwitchingPagesZoomed(app:ApplicationMediator, statesFactory:IAppStatesFactory)
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
			_app.applyState(_statesFactory.getStateRunningZoomed());	
		}		
	}
}