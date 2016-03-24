package states
{
	import org.robotlegs.starling.mvcs.Actor;
	
	public class ApplicationStatesFactory extends Actor implements IApplicationStatesFactory
	{
		/*[Inject]
		public var applicationStateInit:ApplicationStateInit;
		
		[Inject]
		public var applicationStateLoading:ApplicationStateLoading;
		
		[Inject]
		public var applicationStateStart:ApplicationStateStart;
		
		[Inject]
		public var applicationStateUnlocked:ApplicationStateUnlocked;
		
		[Inject]
		public var applicationStateLocked:ApplicationStateLocked;
		
		[Inject]
		public var applicationStatePlaying:ApplicationStatePlaying;
		
		[Inject]
		public var applicationStatePaused:ApplicationStatePaused;*/
		
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
			//applicationStateLoading.setApplication(_application);
			return new ApplicationStateLoading(_application, this);//applicationStateLoading//
		}
		
		public function getStateInit():IApplicationState
		{
			//applicationStateInit.setApplication(_application);
			return new ApplicationStateInit(_application, this);//applicationStateInit;//
		}
		
		public function getStateStart():IApplicationState
		{
			//applicationStateStart.setApplication(_application);
			return new ApplicationStateStart(_application, this);//applicationStateStart//
		}		
		
		public function getStatePlaying():IApplicationState
		{
			//applicationStatePlaying.setApplication(_application);
			return new ApplicationStatePlaying(_application, this);//applicationStatePlaying//
		}
		
		public function getStatePaused():IApplicationState
		{
			//applicationStatePaused.setApplication(_application);
			return new ApplicationStatePaused(_application, this);//applicationStatePaused//
		}
		
	}
}