package controls.factory
{
	public class GestouchControlsFactory extends BaseControlsFactory
	{
		public function GestouchControlsFactory()
		{
			super();
		}
		
		override public function getBuilder():IControlsBuilder
		{
			return new GestouchControlsBuilder();
		}
	}
}