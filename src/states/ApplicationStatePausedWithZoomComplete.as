package states
{
	public class ApplicationStatePausedWithZoomComplete extends ApplicationStatePausedWithZoom
	{
		public function ApplicationStatePausedWithZoomComplete(app:ApplicationMediator, statesFactory:IApplicationStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function play():void
		{			
			_app.hidePauseMenu();
			_app.applyState(applicationStatesFactory.getStatePlayingWithZoomComplete());
			_app.startPlayback();
		}
		
		override public function resume():void
		{			
			_app.hidePauseMenu();
			_app.applyState(applicationStatesFactory.getStatePlayingWithZoomComplete());
			_app.resumePlayback();
		}
	}
}