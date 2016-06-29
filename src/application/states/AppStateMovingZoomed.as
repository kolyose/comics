package application.states
{
	import application.ApplicationMediator;
	
	import flash.geom.Point;
	
	public class AppStateMovingZoomed extends BaseAppState
	{
		public function AppStateMovingZoomed(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{
			super(app, statesFactory);
		}
				
		override public function entry():void
		{
			_app.pause();
		}
				
		override public function move(offset:Point):void
		{
			_app.scroll(offset);
		}
		
		override public function moveComplete(offset:Point):void
		{
			_app.scrollComplete(offset);	
		}		
	}
}