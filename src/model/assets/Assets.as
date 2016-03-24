package model.assets
{
	public class Assets
	{		
		//TODO: combine assets into texture atlases
		
		[Embed(source="../resources/common/touchContainer.png")]
		public static const touchContainer:Class;
		
		[Embed(source="../resources/common/pageBackground.png")]
		public static const pageBackground:Class;
		
		[Embed(source="../resources/common/pauseMenuBg.png")]
		public static const pauseMenuBg:Class;
		
		[Embed(source="../resources/common/replayButton.png")]
		public static const replayButton:Class;
		
		[Embed(source="../resources/common/playButton.png")]
		public static const playButton:Class;
	}
}