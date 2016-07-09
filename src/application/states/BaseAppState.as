package application.states
{
	import application.ApplicationMediator;
	
	import flash.geom.Point;
	
	import org.robotlegs.starling.mvcs.Actor;

	public class BaseAppState implements IAppState
	{		
		protected var _statesFactory:IAppStatesFactory;		
		protected var _app:ApplicationMediator;
		
		public function BaseAppState(app:ApplicationMediator, statesFactory:IAppStatesFactory)
		{	
			_app = app;
			_statesFactory = statesFactory;
		}	
		
		public function entry():void{}		
		public function exit():void{}	
		
		public function play():void{}
		public function replay():void{}
		
		public function move(offset:Point):void{}
		public function moveComplete(offset:Point):void{}
		
		public function tap():void{}
		public function zoom():void{}
		
		
		public function playComplete():void{}
		public function zoomComplete():void{}			
		
		public function resetPosition():void{}		
		public function resetPositionComplete():void{}
		
		public function switchPages(pageNumber:uint):void{}
		public function switchPagesComplete():void{}	
		
		public function showPage(pageNumber:uint):void{}		
		
		public function autoplay():void{}		
		public function theEnd():void{}		
	}
}