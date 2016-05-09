package states
{
	public class ApplicationStatePausedWithZoom extends ApplicationStatePaused
	{
		public function ApplicationStatePausedWithZoom(app:ApplicationMediator, statesFactory:IApplicationStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function play():void
		{			
			_app.hidePauseMenu();
			_app.applyState(applicationStatesFactory.getStatePlayingWithZoom());
			_app.startPlayback();
		}
		
		override public function resume():void
		{			
			_app.hidePauseMenu();
			_app.applyState(applicationStatesFactory.getStatePlayingWithZoom());
			_app.resumePlayback();
		}
	}
}