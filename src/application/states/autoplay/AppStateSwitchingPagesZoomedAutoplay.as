package application.states.autoplay
{
	import application.ApplicationMediator;
	import application.states.IAppStatesFactory;
	
	public class AppStateSwitchingPagesZoomedAutoplay extends AppStateSwitchingPagesAutoplay
	{
		public function AppStateSwitchingPagesZoomedAutoplay(app:ApplicationMediator, statesFactory:IAppStatesFactory)
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
			_app.zoom(); 
		}		
		
		override public function zoomComplete():void
		{
			_app.applyState(_statesFactory.getStateRunningZoomedAutoplay());
		}				
	}
}