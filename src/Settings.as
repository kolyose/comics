package
{
	//TODO: refactor from Singleton to Model and make the class implementing an interface
	public class Settings
	{
		private static var _settings:Settings;
		
		public function Settings(enforcer:SettingsSingletonInforcer)
		{
		}
		
		public static function getInstance():Settings
		{
			if (_settings == null)
			{
				_settings = new Settings(new SettingsSingletonInforcer());
			}
			
			return _settings;
		}
		
		public function get WIDTH():Number
		{
			return 768;
		}
		
		public function get HEIGHT():Number
		{
			return 1024;
		}
		
		public function get intPagesCount():uint
		{
			return 4;
		}
		
		public function get intervalBetweenItemsPlayback():Number
		{
			return 500;
		}
		
		public function get grayscaleFilterStepInterval():Number
		{
			return 100;
		}
		
		public function get grayscaleFilterStepsNumber():uint
		{
			return 10;
		}
		
		public function get switchPagesSpeed():Number
		{
			return .5;
		}
		
		public function get initiateSwitchPagesOffset():Number
		{
			return WIDTH/4;
		}
		
		public function get neighbourPagesNumber():uint
		{
			return 1;
		}
		
		public function get distanceBetweenPages():Number
		{
			return WIDTH/10;
		}
	}
}

internal class SettingsSingletonInforcer {}