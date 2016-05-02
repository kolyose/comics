package events
{
	import starling.events.Event;

	public class ViewEvent
	{		
		public static const RESET_PAGES_VIEW:String = "ViewEvent.RESET_PAGES_VIEW";
		public static const SET_PAGES_POSITION:String = "ViewEvent.SET_PAGES_POSITION";
		public static const ADD_PAGE:String = "ViewEvent.ADD_PAGE";
		public static const TWEEN_PAGES_CONTAINER_POSITION:String = "ViewEvent.TWEEN_PAGES_CONTAINER_POSITION";
		public static const CLEAR_PAGES_CONTAINER_POSITION_TWEEN:String = "ViewEvent.CLEAR_PAGES_CONTAINER_POSITION_TWEEN";
		public static const MOVE_PAGES_CONTAINER:String = "ViewEvent.MOVE_PAGES_CONTAINER";
		public static const SHOW_PAUSE:String = "ViewEvent.SHOW_PAUSE";		
		public static const HIDE_PAUSE:String = "ViewEvent.HIDE_PAUSE";		
		public static const BTN_TRIGGERED:String = "ViewEvent.BTN_TRIGGERED";		
	}
}