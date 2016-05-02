package menu
{
	import starling.textures.Texture;

	public class PauseMenuTexturesData
	{
		private var _bg:Texture;
		private var _btnReplay:Texture;
		private var _btnContinue:Texture;
		
		public function PauseMenuTexturesData()
		{
		}

		public function get btnContinue():Texture
		{
			return _btnContinue;
		}

		public function set btnContinue(value:Texture):void
		{
			_btnContinue = value;
		}

		public function get btnReplay():Texture
		{
			return _btnReplay;
		}

		public function set btnReplay(value:Texture):void
		{
			_btnReplay = value;
		}

		public function get bg():Texture
		{
			return _bg;
		}

		public function set bg(value:Texture):void
		{
			_bg = value;
		}

	}
}