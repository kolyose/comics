package application.states.autoplay
{
	import application.ApplicationMediator;
	import application.states.BaseAppState;
	import application.states.IAppStatesFactory;
	
	import flash.geom.Point;
	import flash.utils.Timer;

	public class AppStateRunningAutoplay extends BaseAppState
	{
		public function AppStateRunningAutoplay(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app,statesFactory);
		}
		
		override public function zoom():void
		{
			_app.applyState(_statesFactory.getStateZoomingINAutoplay());
			_app.zoom();
		}
		
		override public function entry():void
		{					
			_app.play();
		}
		
		override public function playComplete():void
		{
			_app.playComplete();
		}
		
		override public function switchPages(pageNumber:uint):void
		{
			_app.applyState(_statesFactory.getStateSwitchingPagesAutoplay());
			_app.switchPagesAfterDelay(pageNumber);
		}
		
		override public function theEnd():void
		{
			_app.applyState(_statesFactory.getStateMenuAutoplay());
		}
				
		override public function tap():void
		{
			_app.applyState(_statesFactory.getStateMenuAutoplay());
		}
		
		override public function move(offset:Point):void
		{
		//	_app.applyState(_statesFactory.getStateMovingAutoplay());
		//	_app.move(offset)
		}		
	}
}