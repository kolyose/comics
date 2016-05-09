package states
{
	import flash.geom.Point;

	public class ApplicationStatePlayingWithZoomComplete extends ApplicationStatePlaying
	{
		public function ApplicationStatePlayingWithZoomComplete(app:ApplicationMediator, statesFactory:IApplicationStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function zoom():void
		{
			_app.zoomPlayback();
			_app.applyState(applicationStatesFactory.getStatePlayingComplete());
		}
		
		override public function move(offset:Point):void
		{
			_app.scrollPage(offset);
		}
		
		override public function moveComplete(offset:Point):void
		{
			_app.scrollPageComplete(offset);
		}
		
		override public function pause(showMenu:Boolean=false):void
		{						
			_app.applyState(applicationStatesFactory.getStatePausedWithZoomComplete());
			
			if (showMenu)
			{
				_app.showPauseMenu();
			}
		}
	}
}