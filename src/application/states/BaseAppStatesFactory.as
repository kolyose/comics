package application.states
{
	import application.ApplicationMediator;
	import application.states.manual.*;
	import application.states.autoplay.*;
	
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
		
		
		//MANUAL 
		
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
		
		//AUTOPLAY
		
		public function getStateStartAutoplay():IAppState
		{
			return new AppStateStartAutoplay(_application, this);
		}		
		
		public function getStateMenuAutoplay():IAppState
		{
			return new AppStateMenuAutoplay(_application, this);
		}
				
		public function getStateMovingAutoplay():IAppState
		{			
			return new AppStateMovingAutoplay(_application, this);
		}
		
		public function getStateRunningAutoplay():IAppState
		{
			return new AppStateRunningAutoplay(_application, this);
		}
		
		public function getStateSwitchingPagesAutoplay():IAppState
		{
			return new AppStateSwitchingPagesAutoplay(_application, this);
		}
		
		public function getStateZoomingINAutoplay():IAppState
		{
			return new AppStateZoomingINAutoplay(_application, this);
		}
		
		public function getStateZoomingOUTAutoplay():IAppState
		{			
			return new AppStateZoomingOUTAutoplay(_application, this);
		}
		
		public function getStateRunningZoomedAutoplay():IAppState
		{
			return new AppStateRunningZoomedAutoplay(_application, this);
		}
		
		public function getStateMenuZoomedAutoplay():IAppState
		{
			return new AppStateMenuZoomedAutoplay(_application, this);
		}
		
		public function getStateMovingZoomedAutoplay():IAppState
		{			
			return new AppStateMovingZoomedAutoplay(_application, this);
		}
		
		public function getStateSwitchingPagesZoomedAutoplay():IAppState
		{
			return new AppStateSwitchingPagesZoomedAutoplay(_application, this);
		}
		
		public function getStateZoomedPlayCompletionAutoplay():IAppState
		{
			return new AppStateZoomedPlayCompletionAutoplay(_application, this);
		}
	}
}