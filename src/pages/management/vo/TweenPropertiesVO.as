package pages.management.vo
{
	public class TweenPropertiesVO
	{
		protected var _speed:Number;
		protected var _onCompleteHandler:Function;
		
		public function TweenPropertiesVO()
		{
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