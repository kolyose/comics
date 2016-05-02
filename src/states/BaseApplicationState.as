package states
{
	import org.robotlegs.starling.mvcs.Actor;

	public class BaseApplicationState /*extends Actor*/ implements IApplicationState
	{
		//[Inject]
		public var applicationStatesFactory:IApplicationStatesFactory;
		
		protected var _app:ApplicationMediator;
		
		public function BaseApplicationState(app:ApplicationMediator, statesFactory:IApplicationStatesFactory)
		{	
			_app = app;
			applicationStatesFactory = statesFactory;
		}		
		
	/*	public function setApplication(app:ApplicationMediator):void
		{
			_app = app;	
		}*/
		
		public function execute():void
		{
			
		}
		
		public function play():void
		{
			
		}
		
		public function resume():void
		{
			
		}
		
		public function pause(showMenu:Boolean=false):void
		{
			
		}
		
		public function lock():void
		{
			_app.disable();
		}
		
		public function unlock():void
		{
			_app.enable();
		}
		
		public function slide():void
		{
			
		}
	}
}