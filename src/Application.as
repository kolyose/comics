package
{
	import application.ApplicationView;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import org.gestouch.core.Gestouch;
	import org.gestouch.extensions.starling.StarlingDisplayListAdapter;
	import org.gestouch.extensions.starling.StarlingTouchHitTester;
	import org.gestouch.input.NativeInputAdapter;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	
	[SWF(width="768", height="1024", frameRate="31", backgroundColor="#ffffff")]
	
	public class Application extends Sprite
	{
		private var _starling:Starling;
		
		public function Application()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
//			Starling.multitouchEnabled = true;
			
			_starling = new Starling(ApplicationView, stage);
			
			Gestouch.inputAdapter ||= new NativeInputAdapter(stage);
			Gestouch.addDisplayListAdapter(DisplayObject, new StarlingDisplayListAdapter());
			Gestouch.addTouchHitTester(new StarlingTouchHitTester(_starling), -1);
			
	//		_starling.simulateMultitouch = true;
			_starling.start();
		}
	}
}