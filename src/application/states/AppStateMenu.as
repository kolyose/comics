package application.states
{
	import flash.geom.Point;
	import application.ApplicationMediator;

	public class AppStateMenu extends BaseAppState
	{
		public function AppStateMenu(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function entry():void
		{
			_app.disable();
			_app.pause();
			_app.showPauseMenu();
		}
		
		override public function exit():void
		{
			_app.enable();
			_app.hidePauseMenu();
		}
		
		override public function play():void
		{			
			_app.applyState(_statesFactory.getStateRunning());
		}
		
		override public function replay():void
		{		
			_app.applyState(_statesFactory.getStateRunning());
			_app.replay();
		}
		
		override public function showPage(pageNumber:uint):void
		{
			_app.applyState(_statesFactory.getStateSwitchingPages());
			_app.showPage(pageNumber);
		}		
	}
}