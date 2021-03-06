package application.states.manual
{
	import application.ApplicationMediator;
	
	import flash.geom.Point;
	import application.states.BaseAppState;
	import application.states.IAppStatesFactory;
	
	public class AppStateMovingZoomed extends BaseAppState
	{
		public function AppStateMovingZoomed(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
				
		override public function entry():void
		{
			_app.pause();
		}
				
		override public function move(offset:Point):void
		{
			_app.scroll(offset);
		}
		
		override public function moveComplete(offset:Point):void
		{
		//	_app.scrollComplete(offset);	
			_app.moveComplete(offset);	
		}		
		
		override public function switchPages(pageNumber:uint):void
		{		
			_app.applyState(_statesFactory.getStateSwitchingPagesZoomed());
			_app.switchPages(pageNumber);
		}
		
		override public function resetPosition():void
		{
			_app.resetPosition();
		}
		
		override public function resetPositionComplete():void
		{
			_app.applyState(_statesFactory.getStateRunningZoomed());
		}
	}
}