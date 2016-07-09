package events
{
	public class ApplicationEvent
	{		
		public static const ASSETS_LOADED:String = "ApplicationEvent.ASSETS_LOADED";
				
		public static const TAP:String 						= "ApplicationEvent.TAP";		
		public static const DOUBLE_TAP:String 				= "ApplicationEvent.DOUBLE_TAP";
		
		public static const MOVE:String 					= "ApplicationEvent.MOVE";			
		public static const MOVE_COMPLETE:String 			= "ApplicationEvent.MOVE_COMPLETE";	
		
		public static const PLAY:String 					= "ApplicationEvent.PLAY";
		public static const REPLAY:String 					= "ApplicationEvent.REPLAY";		
		public static const PLAY_COMPLETE:String 			= "ApplicationEvent.PLAY_COMPLETE";		
		
		public static const SWITCH_PAGES:String 			= "ApplicationEvent.SWITCH_PAGES";		
		public static const SWITCH_PAGES_COMPLETE:String 	= "ApplicationEvent.SWITCH_PAGES_COMPLETE";
		
		public static const RESET_POSITION:String			= "ApplicationEvent.RESET_POSITION";		
		public static const RESET_POSITION_COMPLETE:String	= "ApplicationEvent.RESET_POSITION_COMPLETE";		
		
		public static const ZOOM:String 					= "ApplicationEvent.ZOOM";		
		public static const ZOOM_COMPLETE:String 			= "ApplicationEvent.ZOOM_COMPLETE";		
		
		public static const SHOW_PAGE:String 				= "ApplicationEvent.SHOW_PAGE";
		
		public static const AUTOPLAY:String 				= "ApplicationEvent.AUTOPLAY";
		public static const THE_END:String 					= "ApplicationEvent.THE_END";
			
	}
}