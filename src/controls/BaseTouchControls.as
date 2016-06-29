package controls
{
	import starling.display.DisplayObject;
	import starling.events.EventDispatcher;
	
	public class BaseTouchControls extends EventDispatcher implements IControls
	{
		protected var _stage:DisplayObject;
				
		public function BaseTouchControls(stage:DisplayObject)
		{
			super();
			_stage = stage;
		}
		
		public function init():void
		{
		}
		
		public function enable():void
		{
		}
		
		public function disable():void
		{
		}
		
		public function reset():void
		{
		}
	}
}