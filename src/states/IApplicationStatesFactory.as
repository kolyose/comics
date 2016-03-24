package states
{
	public interface IApplicationStatesFactory
	{
		function setApplication(app:ApplicationMediator):void;
		
		function getStateLoading():IApplicationState;
		function getStateInit():IApplicationState;
		function getStateStart():IApplicationState;
		function getStatePlaying():IApplicationState;
		function getStatePaused():IApplicationState;
	}
}