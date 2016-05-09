package states
{
	public class ApplicationStatePlayingComplete extends ApplicationStatePlaying
	{
		public function ApplicationStatePlayingComplete(app:ApplicationMediator, statesFactory:IApplicationStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function zoom():void
		{
			_app.zoomPlayback();
			_app.applyState(applicationStatesFactory.getStatePlayingWithZoomComplete());
		}
		
		override public function pause(showMenu:Boolean=false):void
		{			
			_app.applyState(applicationStatesFactory.getStatePausedComplete());
			
			if (showMenu)
			{
				_app.showPauseMenu();
			}
		}
	}
}