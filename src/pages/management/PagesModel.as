package pages.management
{
	import data.PageDO;
	
	import flash.geom.Point;
	import flash.net.SharedObject;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import pages.IPage;

	public class PagesModel extends Actor
	{
		protected var _vPages:Vector.<IPage>;
		protected var _intPagesCount:uint;
		protected var _loadingPageNumber:uint;
		protected var _currentPageNumber:uint=0;
		protected var _containerPosition:Point;
		protected var _temporatyContainerPositionX:Number;
		
		public function PagesModel()
		{
			init();
		}

		public function setPageData(pageData:PageDO):void
		{
			_vPages[pageData.pageNumber].setData(pageData);
		}
		
		private function init():void
		{
			_intPagesCount = Settings.getInstance().intPagesCount;
			_vPages = new Vector.<IPage>(_intPagesCount, true);
			
			containerPosition = new Point(0,0);
		}
		
		public function get vPages():Vector.<IPage>
		{
			return _vPages;
		}

		public function get intPagesCount():uint
		{
			return _intPagesCount;
		}

		public function get loadingPageNumber():uint
		{
			return _loadingPageNumber;
		}

		public function set loadingPageNumber(value:uint):void
		{
			_loadingPageNumber = value;
		}

		public function get currentPageNumber():uint
		{
			return _currentPageNumber;
		}

		public function set currentPageNumber(value:uint):void
		{
			_currentPageNumber = value;
		}

		public function get containerPosition():Point
		{
			return _containerPosition;
		}

		public function set containerPosition(value:Point):void
		{
			_containerPosition = value;
			temporatyContainerPositionX = value.x;
		}

		public function get temporatyContainerPositionX():Number
		{
			return _temporatyContainerPositionX;
		}

		public function set temporatyContainerPositionX(value:Number):void
		{
			_temporatyContainerPositionX = value;
		}


	}
}