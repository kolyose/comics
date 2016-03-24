package controller
{
	import controls.IInputController;
	import controls.InputController;
	import controls.commands.DisableControlsCommand;
	import controls.commands.EnableControlsCommand;
	import controls.factory.BaseControlsFactory;
	import controls.factory.IControlsFactory;
	import controls.factory.TouchControlsFactory;
	
	import events.ApplicationEvent;
	import events.ModelEvent;
	
	import model.assets.AssetsModel;
	
	import org.robotlegs.starling.mvcs.Command;
	
	import pages.factory.BasePageBuilder;
	import pages.factory.BasePageFactory;
	import pages.factory.ConsecutivePageBuilder;
	import pages.factory.ConsecutivePageFactory;
	import pages.factory.PageFactories;
	import pages.items.factory.BaseItemFactory;
	import pages.items.factory.BaseSubitemFactory;
	import pages.items.factory.IItemFactory;
	import pages.items.factory.ISubitemFactory;
	import pages.management.IPagesManager;
	import pages.management.PagesManagerFacade;
	import pages.management.PagesMediator;
	import pages.management.PagesModel;
	import pages.management.PagesView;
	import pages.management.commands.AddNeighbourPagesCommand;
	import pages.management.commands.AddPageCommand;
	import pages.management.commands.DisablePagesManagerCommand;
	import pages.management.commands.EnablePagesManagerCommand;
	import pages.management.commands.MovePagesContainerCommand;
	import pages.management.commands.PagePlaybackCompleteCommand;
	import pages.management.commands.PagesContainerPositionResetCompleteCommand;
	import pages.management.commands.PausePlaybackCommand;
	import pages.management.commands.ReplayPageCommand;
	import pages.management.commands.ResetPagesContainerPositionCommand;
	import pages.management.commands.SetPageDataCommand;
	import pages.management.commands.SetPageEnabledCommand;
	import pages.management.commands.ShowPageCommand;
	import pages.management.commands.StartPlaybackCommand;
	import pages.management.commands.StopPlaybackCommand;
	import pages.management.commands.SwitchPagesCommand;
	import pages.management.commands.SwitchPagesCompleteCommand;
	import pages.management.commands.TweenPagesContainerPositionCommand;
	import pages.management.strategies.ISwitchPagesStrategy;
	import pages.management.strategies.SwitchPagesByContainerPositionTweening;
	import pages.playback.IPlaybackStrategiesFactory;
	import pages.playback.PlaybackStrategiesFactory;
	import pages.states.IPageStatesFactory;
	import pages.states.PageStatesFactory;
	
	import states.ApplicationStateInit;
	import states.ApplicationStateLoading;
	import states.ApplicationStatePaused;
	import states.ApplicationStatePlaying;
	import states.ApplicationStateStart;
	import states.ApplicationStatesFactory;
	import states.BaseApplicationState;
	import states.IApplicationStatesFactory;
	
	public class StartupCommand extends Command
	{
		public function StartupCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			injector.mapSingleton(XMLParser);
			injector.mapSingleton(AssetsModel);
			injector.mapSingleton(PagesModel);			
			injector.mapSingleton(PageFactories);
			injector.mapSingleton(BaseControlsFactory);
			
			//injector.mapSingleton(BaseApplicationState);
			/*injector.mapSingleton(ApplicationStateInit);
			injector.mapSingleton(ApplicationStateLoading);
			injector.mapSingleton(ApplicationStateLocked);
			injector.mapSingleton(ApplicationStatePaused);
			injector.mapSingleton(ApplicationStatePlaying);
			injector.mapSingleton(ApplicationStateStart);
			injector.mapSingleton(ApplicationStateUnlocked);
			*/
			injector.mapSingletonOf(IPagesManager, PagesManagerFacade); 
			injector.mapSingletonOf(ISwitchPagesStrategy, SwitchPagesByContainerPositionTweening); 
			injector.mapSingletonOf(IPageStatesFactory, PageStatesFactory);			
			injector.mapSingletonOf(IInputController, InputController);
			injector.mapSingletonOf(IControlsFactory, TouchControlsFactory);
			injector.mapSingletonOf(IApplicationStatesFactory, ApplicationStatesFactory);			
			injector.mapSingletonOf(IPlaybackStrategiesFactory, PlaybackStrategiesFactory);			
			
			injector.mapSingleton(BasePageFactory);
			injector.mapSingleton(ConsecutivePageFactory);
			injector.mapSingleton(BasePageBuilder);
			injector.mapSingleton(ConsecutivePageBuilder);
			
			injector.mapSingletonOf(IItemFactory, BaseItemFactory);			
			injector.mapSingletonOf(ISubitemFactory, BaseSubitemFactory);						
			
			
			mediatorMap.mapView(ApplicationView, ApplicationMediator);
			mediatorMap.mapView(PagesView, PagesMediator);
			
			commandMap.mapEvent(ModelEvent.PAGE_RESOURCES_LOADED, SetPageDataCommand);
			commandMap.mapEvent(ModelEvent.SHOW_PAGE, ShowPageCommand);
			commandMap.mapEvent(ModelEvent.ADD_PAGE, AddPageCommand);
			commandMap.mapEvent(ModelEvent.ADD_NEIGHBOUR_PAGES, AddNeighbourPagesCommand);
			commandMap.mapEvent(ModelEvent.SWITCH_PAGES_COMPLETE, SwitchPagesCompleteCommand);
			commandMap.mapEvent(ModelEvent.PAGE_PLAYBACK_COMPLETE, PagePlaybackCompleteCommand);
			commandMap.mapEvent(ModelEvent.SWITCH_PAGES, SwitchPagesCommand);
			commandMap.mapEvent(ModelEvent.TWEEN_PAGES_CONTAINER_POSITION, TweenPagesContainerPositionCommand);
			commandMap.mapEvent(ModelEvent.MOVE_PAGES_CONTAINER, MovePagesContainerCommand);
			commandMap.mapEvent(ModelEvent.RESET_PAGES_CONTAINER_POSITION, ResetPagesContainerPositionCommand);
			commandMap.mapEvent(ModelEvent.PAGES_CONTAINER_POSITION_RESET_COMPLETE, PagesContainerPositionResetCompleteCommand);
			commandMap.mapEvent(ModelEvent.SET_PAGE_ENABLED, SetPageEnabledCommand);
			commandMap.mapEvent(ModelEvent.START_PLAYBACK, StartPlaybackCommand);
			commandMap.mapEvent(ModelEvent.STOP_PLAYBACK, StopPlaybackCommand);			
			commandMap.mapEvent(ModelEvent.PAUSE_PLAYBACK, PausePlaybackCommand);			
			commandMap.mapEvent(ModelEvent.ENABLE_PAGES_MANAGER, EnablePagesManagerCommand);
			commandMap.mapEvent(ModelEvent.DISABLE_PAGES_MANAGER, DisablePagesManagerCommand);
			commandMap.mapEvent(ModelEvent.ENABLE_CONTROLS, EnableControlsCommand);
			commandMap.mapEvent(ModelEvent.DISABLE_CONTROLS, DisableControlsCommand);
			commandMap.mapEvent(ModelEvent.MOVE_PAGE, MovePageCommand);
			commandMap.mapEvent(ModelEvent.MOVE_PAGE_COMPLETE, MovePageCompleteCommand);
			commandMap.mapEvent(ModelEvent.HANDLE_TAP, HandleTapCommand);
			commandMap.mapEvent(ModelEvent.REPLAY_PAGE, ReplayPageCommand);						
		}
	}
}