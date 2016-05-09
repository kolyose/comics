package states
{
	import flash.geom.Point;

	public class ApplicationStatePlayingWithZoom extends ApplicationStatePlaying
	{
		public function ApplicationStatePlayingWithZoom(app:ApplicationMediator, statesFactory:IApplicationStatesFactory)
		{
			super(app, statesFactory);
		}		
	
		override public function zoom():void
		{
			_app.zoomPlayback();
			_app.applyState(applicationStatesFactory.getStatePlaying());
		}
		
		override public function playComplete():void
		{	
			_app.zoomPlayback();
			_app.applyState(applicationStatesFactory.getStatePlayingComplete());
		}
		
		override public function pause(showMenu:Boolean=false):void
		{			
			_app.pausePlayback();
			_app.applyState(applicationStatesFactory.getStatePausedWithZoom());
			
			if (showMenu)
			{
				_app.showPauseMenu();
			}
		}
		
		override public function move(offset:Point):void
		{
			
		}
		
		override public function moveComplete(offset:Point):void
		{
			
		}
	}
}