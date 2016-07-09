package application.states.autoplay
{
	import application.ApplicationMediator;
	
	import flash.geom.Point;
	import application.states.BaseAppState;
	import application.states.IAppStatesFactory;

	public class AppStateRunningZoomedAutoplay extends BaseAppState
	{
		public function AppStateRunningZoomedAutoplay(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
	
		override public function zoom():void
		{
			_app.applyState(_statesFactory.getStateZoomingOUTAutoplay());
			_app.zoom();
		}
		
		override public function entry():void
		{			
			_app.play();
		}
		
		override public function playComplete():void
		{
			_app.applyState(_statesFactory.getStateZoomedPlayCompletionAutoplay());
		}	
		
		override public function tap():void
		{
			_app.applyState(_statesFactory.getStateMenuZoomedAutoplay());
		}
		
		override public function move(offset:Point):void
		{
			//_app.applyState(_statesFactory.getStateMovingZoomedAutoplay());
			//_app.scroll(offset);
		}
	}
}