package data
{
	public class PageDO
	{
		protected var _pageNumber:uint;
		protected var _vItemsData:Vector.<ItemDO>;
				
		public function PageDO()
		{
			_vItemsData = new Vector.<ItemDO>();
		}

		public function get pageNumber():uint
		{
			return _pageNumber;
		}

		public function setPageNumber(value:uint):void
		{
			_pageNumber = value;
			
			for each (var itemDO:ItemDO in _vItemsData)
			{
				itemDO.setPageNumber(_pageNumber);
			}
		}

		public function get vItemsData():Vector.<ItemDO>
		{
			return _vItemsData;
		}

		public function set vItemsData(value:Vector.<ItemDO>):void
		{
			_vItemsData = value;
		}


	}
}