package pages.factory
{
	public class ConsecutivePageFactory extends BasePageFactory
	{
		[Inject]
		public var builder:ConsecutivePageBuilder;
		
		public function ConsecutivePageFactory()
		{
			super();
		}
		
		override protected function getBuilder():IPageBuilder
		{
			return builder;
			
			/*if (!_builder)			
				_builder = new ConsecutivePageBuilder();
			
			return _builder;*/
		}
	}
}