package states
{
	public class ApplicationStatePausedComplete extends ApplicationStatePaused
	{
		public function ApplicationStatePausedComplete(app:ApplicationMediator, statesFactory:IApplicationStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function play():void
		{			
			_app.hidePauseMenu();
			_app.applyState(applicationStatesFactory.getStatePlayingComplete());
			_app.startPlayback();
		}
		
		override public function resume():void
		{			
			_app.hidePauseMenu();
			_app.applyState(applicationStatesFactory.getStatePlayingComplete());
			_app.resumePlayback();
		}
	}
}