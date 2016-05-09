package states
{
	import events.ApplicationEvent;
	
	import flash.geom.Point;

	public class ApplicationStatePlaying extends BaseApplicationState
	{
		public function ApplicationStatePlaying(app:ApplicationMediator, statesFactory:IApplicationStatesFactory)
		{
			super(app, statesFactory);
		}
		
		override public function execute():void
		{			
			//_app.hideLock();
			//_app.hidePauseMenu();
			//_app.startPlayback();
		}		
		
		//Page playback completeness causes switching pages after which we need to start playback again on a new page
		//All this process is executed while ApplicationStatePlaying state
		//So we need to have and call a method play() withing the state in order to initiate the new page's playback 
		override public function play():void
		{
			_app.startPlayback();
		}
		
		override public function resume():void
		{
			_app.resumePlayback();
		}
		
		override public function pause(showMenu:Boolean=false):void
		{			
			_app.pausePlayback();
			_app.applyState(applicationStatesFactory.getStatePaused());
			
			if (showMenu)
			{
				_app.showPauseMenu();
			}
		}
		
		override public function lock():void
		{
			_app.disable();
			_app.showLock();
		}
		
		override public function unlock():void
		{
			_app.enable();
			_app.hideLock();
		}
		
		override public function move(offset:Point):void
		{
			_app.movePage(offset);
		}
		
		override public function moveComplete(offset:Point):void
		{
			_app.movePageComplete(offset);
		}
		
		override public function zoom():void
		{
			_app.zoomPlayback();
			_app.applyState(applicationStatesFactory.getStatePlayingWithZoom());
		}
		
		override public function playComplete():void
		{			
			_app.applyState(applicationStatesFactory.getStatePlayingComplete());
		}
	}
}