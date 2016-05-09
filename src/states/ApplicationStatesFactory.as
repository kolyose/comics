package states
{
	import org.robotlegs.starling.mvcs.Actor;
	
	public class ApplicationStatesFactory extends Actor implements IApplicationStatesFactory
	{
		private var _application:ApplicationMediator;
		
		public function ApplicationStatesFactory()
		{
			super();
		}
		
		public function setApplication(app:ApplicationMediator):void
		{
			_application = app;
		}
		
		public function getStateLoading():IApplicationState
		{
			return new ApplicationStateLoading(_application, this);
		}
		
		public function getStateInit():IApplicationState
		{
			return new ApplicationStateInit(_application, this);
		}
		
		public function getStateStart():IApplicationState
		{
			return new ApplicationStateStart(_application, this);
		}		
		
		public function getStatePlaying():IApplicationState
		{			
			return new ApplicationStatePlaying(_application, this);
		}
		
		public function getStatePlayingComplete():IApplicationState
		{			
			return new ApplicationStatePlayingComplete(_application, this);
		}
		
		public function getStatePlayingWithZoom():IApplicationState
		{
			return new ApplicationStatePlayingWithZoom(_application, this);
		}
		
		public function getStatePlayingWithZoomComplete():IApplicationState
		{
			return new ApplicationStatePlayingWithZoomComplete(_application, this);
		}
		
		public function getStatePaused():IApplicationState
		{
			return new ApplicationStatePaused(_application, this);
		}		
		
		public function getStatePausedComplete():IApplicationState
		{
			return new ApplicationStatePausedComplete(_application, this);
		}		
		
		public function getStatePausedWithZoom():IApplicationState
		{
			return new ApplicationStatePausedWithZoom(_application, this);
		}	
		
		public function getStatePausedWithZoomComplete():IApplicationState
		{
			return new ApplicationStatePausedWithZoomComplete(_application, this);
		}		
	}
}