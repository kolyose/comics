package application.states
{
	import application.ApplicationMediator;

	public interface IAppStatesFactory
	{
		function setApplication(app:ApplicationMediator):void;
		
		function getStateLoading()					:IAppState;
		function getStateInit()						:IAppState;
		
		function getStateStart()					:IAppState;		
		function getStateRunning()					:IAppState;
		function getStateMenu()						:IAppState;
		function getStateMoving()					:IAppState;
		function getStateSwitchingPages()			:IAppState;
		function getStateZoomingIN()				:IAppState;
		function getStateZoomingOUT()				:IAppState;
		function getStateRunningZoomed()			:IAppState;
		function getStateMenuZoomed()				:IAppState;
		function getStateMovingZoomed()				:IAppState;
		function getStateSwitchingPagesZoomed()		:IAppState;
		function getStateZoomedPlayCompletion()		:IAppState;
		
		function getStateStartAutoplay()					:IAppState;
		function getStateRunningAutoplay()					:IAppState;
		function getStateMenuAutoplay()						:IAppState;
		function getStateMovingAutoplay()					:IAppState;
		function getStateSwitchingPagesAutoplay()			:IAppState;
		function getStateZoomingINAutoplay()				:IAppState;
		function getStateZoomingOUTAutoplay()				:IAppState;
		function getStateRunningZoomedAutoplay()			:IAppState;
		function getStateMenuZoomedAutoplay()				:IAppState;
		function getStateMovingZoomedAutoplay()				:IAppState;
		function getStateSwitchingPagesZoomedAutoplay()		:IAppState;
		function getStateZoomedPlayCompletionAutoplay()		:IAppState;
		
	}
}