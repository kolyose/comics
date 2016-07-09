package application.states.autoplay
{
	import application.ApplicationMediator;
	
	import flash.geom.Point;
	import application.states.BaseAppState;
	import application.states.IAppStatesFactory;

	public class AppStateMovingAutoplay extends BaseAppState
	{
		public function AppStateMovingAutoplay(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function resetPosition():void
		{
			_app.resetPosition();
		}
		
		override public function resetPositionComplete():void
		{
			_app.applyState(_statesFactory.getStateRunningAutoplay());
		}
		
		override public function switchPages(pageNumber:uint):void
		{		
			_app.applyState(_statesFactory.getStateSwitchingPagesAutoplay());
			_app.switchPages(pageNumber);
		}
		
		override public function entry():void
		{
			_app.pause();
		}
		
		override public function move(offset:Point):void
		{
			_app.move(offset);
		}
		
		override public function moveComplete(offset:Point):void
		{
			_app.moveComplete(offset);	
		}		
	}
}