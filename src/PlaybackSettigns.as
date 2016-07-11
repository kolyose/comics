package
{
	public class PlaybackSettigns implements IPlaybackSettings
	{
		private var _autoplayModeEnabled:Boolean = Settings.getInstance().autoplayEnabledByDefault;
		private var _playbackSpeed:uint = Settings.getInstance().defaultPlaybackSpeed;
		
		public function PlaybackSettigns()
		{
		}

		public function get playbackSpeed():uint
		{
			return _playbackSpeed;
		}

		public function set playbackSpeed(value:uint):void
		{
			_playbackSpeed = value;
		}

		public function set autoplayModeEnabled(value:Boolean):void
		{
			_autoplayModeEnabled = value;
		}

		public function get autoplayModeEnabled():Boolean
		{
			return _autoplayModeEnabled;
		}
	}
}