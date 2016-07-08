package application.states
{
	import flash.geom.Point;
	import application.ApplicationMediator;

	public class AppStateRunningZoomed extends BaseAppState
	{
		public function AppStateRunningZoomed(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
	
		override public function doubleTap():void
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
			_app.playComplete();
		}
		
		override public function switchPages(pageNumber:uint):void
		{
			_app.applyState(_statesFactory.getStateSwitchingPagesZoomed());
			_app.switchPages(pageNumber);
		}
		
		override public function tap():void
		{
			_app.applyState(_statesFactory.getStateMenuZoomed());
		}
		
	}
}