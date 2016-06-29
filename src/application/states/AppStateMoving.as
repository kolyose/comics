package application.states
{
	import application.ApplicationMediator;
	
	import flash.geom.Point;

	public class AppStateMoving extends BaseAppState
	{
		public function AppStateMoving(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function resetPosition():void
		{
			_app.resetPosition();
		}
		
		override public function resetPositionComplete():void
		{
			_app.applyState(_statesFactory.getStateRunning());
		}
		
		override public function switchPages(pageNumber:uint):void
		{		
			_app.applyState(_statesFactory.getStateSwitchingPages());
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