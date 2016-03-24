package data
{
	import flash.geom.Point;

	public class SubitemDO
	{
		private var _ID:uint;
		private var _pageNumber:uint;
		private var _type:String;
		private var _name:String;
		private var _instanceName:String;
		
		public function SubitemDO()
		{
		}

		public function get ID():uint
		{
			return _ID;
		}

		public function set ID(value:uint):void
		{
			_ID = value;
		}

		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}

		public function get pageNumber():uint
		{
			return _pageNumber;
		}

		public function set pageNumber(value:uint):void
		{
			_pageNumber = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get instanceName():String
		{
			return _instanceName;
		}

		public function set instanceName(value:String):void
		{
			_instanceName = value;
		}


	}
}