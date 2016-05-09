package states
{
	import events.ApplicationEvent;
	
	import flash.geom.Point;

	public class ApplicationStatePaused extends BaseApplicationState
	{
		public function ApplicationStatePaused(app:ApplicationMediator, statesFactory:IApplicationStatesFactory)
		{
			super(app,statesFactory);
		}
		
		override public function execute():void
		{
		//	_app.pausePlayback();
		//	_app.showLock();
		}
		
		override public function play():void
		{			
			_app.hidePauseMenu();
			_app.applyState(applicationStatesFactory.getStatePlaying());
			_app.startPlayback();
		}
		
		override public function resume():void
		{			
			_app.hidePauseMenu();
			_app.applyState(applicationStatesFactory.getStatePlaying());
			_app.resumePlayback();
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
	}
}