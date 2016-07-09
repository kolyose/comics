package application.states.autoplay
{
	import flash.geom.Point;
	import application.ApplicationMediator;
	import application.states.BaseAppState;
	import application.states.IAppStatesFactory;

	public class AppStateSwitchingPagesAutoplay extends BaseAppState
	{
		public function AppStateSwitchingPagesAutoplay(app:ApplicationMediator, statesFactory:IAppStatesFactory)
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
		
		override public function switchPagesComplete():void
		{
			_app.applyState(_statesFactory.getStateRunningAutoplay());	
			_app.switchPagesComplete();	
		}		
	}
}