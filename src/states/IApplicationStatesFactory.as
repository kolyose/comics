package states
{
	public interface IApplicationStatesFactory
	{
		function setApplication(app:ApplicationMediator):void;
		
		function getStateLoading()					:IApplicationState;
		function getStateInit()						:IApplicationState;
		function getStateStart()					:IApplicationState;
		function getStatePlaying()					:IApplicationState;
		function getStatePlayingComplete()			:IApplicationState;
		function getStatePlayingWithZoom()			:IApplicationState;
		function getStatePlayingWithZoomComplete()	:IApplicationState;
		function getStatePaused()					:IApplicationState;
		function getStatePausedComplete()			:IApplicationState;
		function getStatePausedWithZoom()			:IApplicationState;
		function getStatePausedWithZoomComplete()	:IApplicationState;
	}
}