package application.states.manual
{
	import application.ApplicationMediator;
	
	import flash.geom.Point;
	import application.states.BaseAppState;
	import application.states.IAppStatesFactory;

	public class AppStateRunningZoomed extends BaseAppState
	{
		public function AppStateRunningZoomed(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
	
		override public function zoom():void
		{
			_app.applyState(_statesFactory.getStateZoomingOUT());
			_app.zoom();
		}
		
		override public function entry():void
		{			
			_app.play();
		}
		
		override public function move(offset:Point):void
		{
			_app.applyState(_statesFactory.getStateMovingZoomed());
			_app.scroll(offset);
		}
		
		override public function playComplete():void
		{
		//	zoom();
		//	_app.applyState(_statesFactory.getStateZoomedPlayCompletion());
		}		
				
		override public function tap():void
		{
			_app.applyState(_statesFactory.getStateMenuZoomed());
		}
		
	}
}