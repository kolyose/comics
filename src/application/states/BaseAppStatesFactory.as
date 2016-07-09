package application.states
{
	import application.ApplicationMediator;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	public class BaseAppStatesFactory extends Actor implements IAppStatesFactory
	{
		private var _application:ApplicationMediator;
		
		public function BaseAppStatesFactory()
		{
			super();
		}
		
		public function setApplication(app:ApplicationMediator):void
		{
			_application = app;
		}
		
		public function getStateLoading():IAppState
		{
			return new AppStateLoading(_application, this);
		}
		
		public function getStateInit():IAppState
		{
			return new AppStateInit(_application, this);
		}
		
		public function getStateStart():IAppState
		{
			return new AppStateStart(_application, this);
		}		
		
		public function getStateMenu():IAppState
		{
			return new AppStateMenu(_application, this);
		}
		
		public function getStateMoving():IAppState
		{			
			return new AppStateMoving(_application, this);
		}
		
		public function getStateRunning():IAppState
		{
			return new AppStateRunning(_application, this);
		}
		
		public function getStateSwitchingPages():IAppState
		{
			return new AppStateSwitchingPages(_application, this);
		}
		
		public function getStateZoomingIN():IAppState
		{
			return new AppStateZoomingIN(_application, this);
		}
		
		public function getStateZoomingOUT():IAppState
		{			
			return new AppStateZoomingOUT(_application, this);
		}
		
		public function getStateRunningZoomed():IAppState
		{
			return new AppStateRunningZoomed(_application, this);
		}
		
		public function getStateMenuZoomed():IAppState
		{
			return new AppStateMenuZoomed(_application, this);
		}
		
		public function getStateMovingZoomed():IAppState
		{			
			return new AppStateMovingZoomed(_application, this);
		}
		
		public function getStateSwitchingPagesZoomed():IAppState
		{
			return new AppStateSwitchingPagesZoomed(_application, this);
		}
		
		public function getStateZoomedPlayCompletion():IAppState
		{
			return new AppStateZoomedPlayCompletion(_application, this);
		}
	}
}