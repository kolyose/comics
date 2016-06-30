package application.states
{
	import flash.geom.Point;
	import application.ApplicationMediator;

	public class AppStateZoomingOUT extends BaseAppState
	{
		public function AppStateZoomingOUT(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
			
		override public function entry():void
		{
			//_app.disable();
		}
		
		override public function exit():void
		{
			//_app.enable();
		}
		
		override public function zoomComplete():void
		{			
			_app.applyState(_statesFactory.getStateRunning());
		}
		
	}
}