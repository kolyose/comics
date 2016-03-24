package data
{
	import flash.geom.Matrix;

	public class SubitemStateDO
	{
		private var _ID:uint;
		private var _name:String;
		private var _instanceName:String;
		private var _matrix:Matrix;
		private var _alpha:Number=1;
		
		public function SubitemStateDO()
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

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get alpha():Number
		{
			return _alpha;
		}

		public function set alpha(value:Number):void
		{
			_alpha = value;
		}

		public function get matrix():Matrix
		{
			return _matrix;
		}

		public function set matrix(value:Matrix):void
		{
			_matrix = value;
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