package application.states
{
	import application.ApplicationMediator;
	
	public class AppStateMenuZoomed extends AppStateMenu
	{
		public function AppStateMenuZoomed(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function play():void
		{			
			_app.applyState(_statesFactory.getStateRunningZoomed());
		}
		
		override public function replay():void
		{		
			_app.applyState(_statesFactory.getStateRunningZoomed());
			_app.replay();
		}
		
		override public function showPage(pageNumber:uint):void
		{
			_app.applyState(_statesFactory.getStateSwitchingPagesZoomed());
			_app.showPage(pageNumber);
		}		
	}
}