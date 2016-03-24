package data
{
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import starling.utils.MatrixUtil;

	public class ItemDO
	{
		private var _pageNumber:uint;
		private var _name:String;
		private var _matrix:Matrix;
		private var _vSubitemsData:Vector.<SubitemDO>;
		private var _arrSubitemStatesPerFrame:Array; /*of Vectors*/		
		
		public function ItemDO()
		{
		}

		public function get pageNumber():uint
		{
			return _pageNumber;
		}

		public function setPageNumber(value:uint):void
		{
			_pageNumber = value;
			
			for each (var subitemDO:SubitemDO in _vSubitemsData)
			{
				subitemDO.pageNumber = _pageNumber;
			}
		}

		public function get vSubitemsData():Vector.<SubitemDO>
		{
			return _vSubitemsData;
		}

		public function set vSubitemsData(value:Vector.<SubitemDO>):void
		{
			_vSubitemsData = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}
		
		public function get matrix():Matrix
		{
			return _matrix;
		}

		public function set matrix(value:Matrix):void
		{
			_matrix = value;
		}

		public function get arrSubitemStatesPerFrame():Array
		{
			return _arrSubitemStatesPerFrame;
		}

		public function set arrSubitemStatesPerFrame(value:Array):void
		{
			_arrSubitemStatesPerFrame = value;
		}


	}
}