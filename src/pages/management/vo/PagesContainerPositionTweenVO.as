package pages.management.vo
{
	public class PagesContainerPositionTweenVO
	{
		private var _targetX:Number;
		private var _speed:Number;
		private var _onCompleteHandler:Function;

		public function PagesContainerPositionTweenVO()
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

		public function get speed():Number
		{
			return _speed;
		}

		public function set speed(value:Number):void
		{
			_speed = value;
		}

		public function get onCompleteHandler():Function
		{
			return _onCompleteHandler;
		}

		public function set onCompleteHandler(value:Function):void
		{
			_onCompleteHandler = value;
		}
	}
}