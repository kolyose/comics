package application.states.autoplay
{
	import flash.geom.Point;
	import application.ApplicationMediator;
	import application.states.BaseAppState;
	import application.states.IAppStatesFactory;

	public class AppStateZoomingOUTAutoplay extends BaseAppState
	{
		public function AppStateZoomingOUTAutoplay(app:ApplicationMediator, statesFactory:IAppStatesFactory)
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
			_app.applyState(_statesFactory.getStateRunningAutoplay());
		}
		
	}
}