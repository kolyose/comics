package
{
	public class PlaybackSettigns implements IPlaybackSettings
	{
		private var _autoplayModeEnabled:Boolean;
		
		public function PlaybackSettigns()
		{
		}

		public function set autoplayModeEnabled(value:Boolean):void
		{
			_autoplayModeEnabled = value;
		}

		public function get autoplayModeEnabled():Boolean
		{
			return true;
		}
	}
}