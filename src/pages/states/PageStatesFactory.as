package pages.states
{
	import org.robotlegs.starling.mvcs.Actor;
	
	import pages.IPage;

	public class PageStatesFactory extends Actor implements IPageStatesFactory
	{
		public function PageStatesFactory()
		{
		}
		
		public function getStateInitial(page:IPage):IPageState
		{
			return new PageStateInitial(page, this);
		}
		
		public function getStatePendingPlay(page:IPage):IPageState
		{
			return new PageStatePendingPlay(page, this);
		}
		
		public function getStateReadyToPlay(page:IPage):IPageState
		{
			return new PageStateReadyToPlay(page, this);
		}
		
		public function getStatePlaybackStarted(page:IPage):IPageState
		{
			return new PageStatePlaybackStarted(page, this);
		}
		
		public function getStatePlaybackPaused(page:IPage):IPageState
		{
			return new PageStatePlaybackPaused(page, this);
		}
		
		public function getStatePlaybackComplete(page:IPage):IPageState
		{
			return new PageStatePlaybackComplete(page, this);
		}
	}
}