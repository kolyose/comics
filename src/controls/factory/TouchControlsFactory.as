package controls.factory
{
	public class TouchControlsFactory extends BaseControlsFactory
	{
		public function TouchControlsFactory()
		{
			super();
		}
		
		override public function getBuilder():IControlsBuilder
		{
			return new TouchControlsBuilder();
		}
	}
}