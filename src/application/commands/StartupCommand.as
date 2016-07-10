package application.commands
{
	import application.ApplicationMediator;
	import application.ApplicationView;
	import application.states.BaseAppStatesFactory;
	import application.states.IAppStatesFactory;
	
	import controls.IInputController;
	import controls.InputController;
	import controls.commands.DisableControlsCommand;
	import controls.commands.EnableControlsCommand;
	import controls.commands.HandleDoubleTapCommand;
	import controls.commands.HandleTapCommand;
	import controls.factory.BaseControlsFactory;
	import controls.factory.GestouchControlsFactory;
	import controls.factory.IControlsFactory;
	import controls.factory.TouchControlsFactory;
	
	import events.ApplicationEvent;
	import events.CommandEvent;
	import events.ControlsEvent;
	import events.PagesEvent;
	
	import menu.PauseMenuMediator;
	import menu.PauseMenuView;
	
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
	import pages.management.commands.MovePagesContainerCommand;
	import pages.management.commands.PauseCommand;
	import pages.management.commands.PlayCommand;
	import pages.management.commands.ReplayCommand;
	import pages.management.commands.ResetPagesContainerPositionCommand;
	import pages.management.commands.SetPageDataCommand;
	import pages.management.commands.SetPageEnabledCommand;
	import pages.management.commands.ShowPageCommand;
	import pages.management.commands.ZoomPlaybackCommand;
	import pages.management.strategies.ISwitchPagesStrategy;
	import pages.management.strategies.SwitchPagesByContainerPositionTweening;
	import pages.playback.IPlaybackStrategiesFactory;
	import pages.playback.PlaybackStrategiesFactory;
	import pages.states.IPageStatesFactory;
	import pages.states.PageStatesFactory;
		
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
			
			injector.mapSingletonOf(IAppStatesFactory, BaseAppStatesFactory);
			injector.mapSingletonOf(IPagesManager, PagesManagerFacade); 
			injector.mapSingletonOf(ISwitchPagesStrategy, SwitchPagesByContainerPositionTweening); 
			injector.mapSingletonOf(IPageStatesFactory, PageStatesFactory);			
			injector.mapSingletonOf(IInputController, InputController);
		//	injector.mapSingletonOf(IControlsFactory, TouchControlsFactory);
			injector.mapSingletonOf(IControlsFactory, GestouchControlsFactory);
			injector.mapSingletonOf(IPlaybackStrategiesFactory, PlaybackStrategiesFactory);			
			injector.mapSingletonOf(IPlaybackSettings, PlaybackSettigns);			
			
			injector.mapSingleton(BasePageFactory);
			injector.mapSingleton(ConsecutivePageFactory);
			injector.mapSingleton(BasePageBuilder);
			injector.mapSingleton(ConsecutivePageBuilder);
			
			injector.mapSingletonOf(IItemFactory, BaseItemFactory);			
			injector.mapSingletonOf(ISubitemFactory, BaseSubitemFactory);						
			
			
			mediatorMap.mapView(ApplicationView, ApplicationMediator);
			mediatorMap.mapView(PagesView, PagesMediator);
			mediatorMap.mapView(PauseMenuView, PauseMenuMediator);
			
			commandMap.mapEvent(PagesEvent.ADD_PAGE, AddPageCommand);
			commandMap.mapEvent(PagesEvent.ADD_NEIGHBOUR_PAGES, AddNeighbourPagesCommand);
			commandMap.mapEvent(PagesEvent.RESET_PAGES_CONTAINER_POSITION, ResetPagesContainerPositionCommand);
						
			commandMap.mapEvent(CommandEvent.RESET_PAGES_POSITION, ResetPagesPositionCommand);
			commandMap.mapEvent(CommandEvent.PAGE_RESOURCES_LOADED, SetPageDataCommand);
			commandMap.mapEvent(CommandEvent.SHOW_PAGE, ShowPageCommand);
			commandMap.mapEvent(CommandEvent.SWITCH_PAGES_COMPLETE, SwitchPagesCompleteCommand);			
			commandMap.mapEvent(CommandEvent.SWITCH_PAGES, SwitchPagesCommand);
			commandMap.mapEvent(CommandEvent.MOVE_PAGES_CONTAINER, MovePagesContainerCommand);			
			commandMap.mapEvent(CommandEvent.PLAY_COMPLETE, PlayCompleteCommand);			
			commandMap.mapEvent(CommandEvent.RESET_PAGE, ResetPageCommand);			
			commandMap.mapEvent(CommandEvent.RESET_SUBSEQUENT_PAGES, ResetSubsequentPagesCommand);			
			commandMap.mapEvent(CommandEvent.RESET_ZOOM, ResetZoomCommand);			
			
			commandMap.mapEvent(CommandEvent.SET_PAGE_ENABLED, SetPageEnabledCommand);
			commandMap.mapEvent(CommandEvent.REPLAY, ReplayCommand);
			commandMap.mapEvent(CommandEvent.PLAY, PlayCommand);		
			commandMap.mapEvent(CommandEvent.PAUSE, PauseCommand);			
			commandMap.mapEvent(CommandEvent.ZOOM_PLAYBACK, ZoomPlaybackCommand);
			commandMap.mapEvent(CommandEvent.ENABLE_CONTROLS, EnableControlsCommand);
			commandMap.mapEvent(CommandEvent.DISABLE_CONTROLS, DisableControlsCommand);
			commandMap.mapEvent(CommandEvent.MOVE_PAGE, MovePageCommand);
			commandMap.mapEvent(CommandEvent.MOVE_PAGE_COMPLETE, MovePageCompleteCommand);
			commandMap.mapEvent(CommandEvent.SCROLL_PAGE, ScrollPageCommand);
			commandMap.mapEvent(CommandEvent.SCROLL_PAGE_COMPLETE, ScrollPageCompleteCommand);			
			commandMap.mapEvent(CommandEvent.SAVE_LOCAL_DATA, SaveLocalDataCommand);				
			commandMap.mapEvent(CommandEvent.GET_LOCAL_DATA, GetLocalDataCommand);
			
			commandMap.mapEvent(ControlsEvent.HANDLE_TAP, HandleTapCommand);						
			commandMap.mapEvent(ControlsEvent.HANDLE_DOUBLE_TAP, HandleDoubleTapCommand);						
		}
	}
}