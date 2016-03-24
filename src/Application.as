package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	
	[SWF(width="768", height="1024", frameRate="31", backgroundColor="#ffffff")]
	
	public class Application extends Sprite
	{
		private var _starling:Starling;
		
		public function Application()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
//			Starling.multitouchEnabled = true;
			
			//SWITCH TO MainView CLASS INSTEAD OF Main CLASS WHEN Robotlegs INTEGRATION BE FINISHED
			_starling = new Starling(ApplicationView, stage);
			
	//		_starling.simulateMultitouch = true;
			_starling.start();
		}
	}
}