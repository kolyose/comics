package
{
	import application.commands.StartupCommand;
	
	import org.robotlegs.starling.base.ContextEventType;
	import org.robotlegs.starling.mvcs.Context;
	
	import starling.display.DisplayObjectContainer;
	
	public class MainContext extends Context
	{
		public function MainContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			trace("MainContext::startup");
			
			commandMap.mapEvent(ContextEventType.STARTUP, StartupCommand);
			dispatchEventWith(ContextEventType.STARTUP);
		}
	}
}