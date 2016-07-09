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
			//TODO: decide how handle a situation when a current page's playback has finished,
			//so playing it won't throw PLAY_COMPLETE anymore, but a zoom is still called - so the page has stucked in the middle of zoom...
			//... or it is OK?
			_app.zoom(); 
		}		
		
		override public function zoomComplete():void
		{
			_app.applyState(_statesFactory.getStateRunningZoomed());	
		}		
		
	}
}