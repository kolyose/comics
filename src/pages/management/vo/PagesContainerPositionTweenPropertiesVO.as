package pages.management.vo
{
	public class PagesContainerPositionTweenPropertiesVO extends TweenPropertiesVO
	{
		private var _targetX:Number;
	
		public function PagesContainerPositionTweenPropertiesVO()
		{
		}
		
		public function get targetX():Number
		{
			return _targetX;
		}

		public function set targetX(value:Number):void
		{
			_targetX = value;
		}

		
	}
}