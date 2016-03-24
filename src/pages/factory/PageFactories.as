package pages.factory
{
	import org.robotlegs.starling.mvcs.Actor;
	
	public class PageFactories extends Actor
	{
		[Inject]
		public var consecutivePageFactory:ConsecutivePageFactory;
		
		private var _factories:Array;
		
		public function PageFactories()
		{
			_factories = [];
		}
		
		public function getFactoryByPageType(type:uint):IPageFactory
		{
			if (type > 0 && type < _factories.length && _factories[type]){
				return _factories[type];				
			}
			
			var factory:IPageFactory;			
			switch(type)
			{
				case PagePlaybackType.CONSEQUTIVE:
				{
					//TODO: anywhere a new keyword is used to create a class - injections doesn't work with this class, because the Injector doesn't know about it.
					// So if we want to use injections in a class - it should be also injected!
					
					//useful link: http://knowledge.robotlegs.org/discussions/robotlegs-2/8182-the-necessary-conditions-of-injection-to-work
					//factory = new ConsecutivePageFactory();
					factory = consecutivePageFactory;
					break;
				}					
				
				default:
					break;
			}
			
			_factories[type] = factory;
			return factory;
		}
	}
}