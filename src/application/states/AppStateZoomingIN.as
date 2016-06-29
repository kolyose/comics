package application.states
{
	import application.ApplicationMediator;
	
	import flash.geom.Point;

	public class AppStateZoomingIN extends BaseAppState
	{
		public function AppStateZoomingIN(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function entry():void
		{
			_app.pause();
		}
		
		override public function zoomComplete():void
		{
			_app.applyState(_statesFactory.getStateRunningZoomed());
		}
		
	}
}