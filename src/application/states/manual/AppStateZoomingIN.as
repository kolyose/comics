package application.states.manual
{
	import application.ApplicationMediator;
	
	import flash.geom.Point;
	import application.states.BaseAppState;
	import application.states.IAppStatesFactory;

	public class AppStateZoomingIN extends BaseAppState
	{
		public function AppStateZoomingIN(app:ApplicationMediator, statesFactory:IAppStatesFactory)
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
		
		override public function zoomComplete():void
		{			
			_app.applyState(_statesFactory.getStateRunningZoomed());
		}
		
	}
}