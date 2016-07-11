package menu
{
	import events.ApplicationEvent;
	import events.CommandEvent;
	import events.ModelEvent;
	import events.ViewEvent;
	
	import model.assets.AssetsModel;
	
	import org.robotlegs.starling.mvcs.Mediator;
	
	import starling.core.starling_internal;
	import starling.events.Event;
	
	public class PauseMenuMediator extends Mediator
	{
		[Inject]
		public var view:PauseMenuView;
		
		[Inject]
		public var assetsModel:AssetsModel;
		
		[Inject]
		public var playbackSettings:IPlaybackSettings;
		
		public function PauseMenuMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			addViewListener(ViewEvent.BTN_TRIGGERED, btnTriggeredHandler);
			addViewListener(ViewEvent.SHOW_PAGE, viewShowPageHandler);
			addViewListener(ViewEvent.AUTOPLAY_CHANGE, autoplayChangeHandler);
			addViewListener(ViewEvent.PLAYBACK_SPEED_CHANGE, playbackSpeedChangeHandler);
			
			addContextListener(ModelEvent.PAGE_NUMBER_CHANGED, pageNumberChangedHandler);
			
			var texturesData:PauseMenuTexturesData = new PauseMenuTexturesData();
			texturesData.bg = assetsModel.getTexture("pauseMenuBg"); 
			texturesData.btnReplay = assetsModel.getTexture("replayButton");
			texturesData.btnContinue = assetsModel.getTexture("playButton");
			view.init(texturesData);
			
			var pageNavigatorTextures:Object = {};
			pageNavigatorTextures.sliderThumbSkin = assetsModel.getTexture("pagesSliderThumbSkin");
			pageNavigatorTextures.minTrackDefaultSkin = assetsModel.getTexture("pagesSliderTrackSkin");
			view.initPageNavigator(pageNavigatorTextures, Settings.getInstance().intPagesCount);
			
			var autoplayCheckboxTextures:Object = {};
			autoplayCheckboxTextures.defaultIcon = assetsModel.getTexture("autoplayOff");
			autoplayCheckboxTextures.defaultSelectedIcon = assetsModel.getTexture("autoplayOn");
			view.initAutoplayCheckbox(autoplayCheckboxTextures, playbackSettings.autoplayModeEnabled);
			
			var speedSelectorTextures:Object = {};
			speedSelectorTextures.sliderThumbSkin = assetsModel.getTexture("pagesSliderThumbSkin");
			speedSelectorTextures.minTrackDefaultSkin = assetsModel.getTexture("pagesSliderTrackSkin");
			view.initSpeedSelector(pageNavigatorTextures, playbackSettings.playbackSpeed, Settings.getInstance().minPlaybackSpeed, Settings.getInstance().maxPlaybackSpeed);			
		}
		
		private function btnTriggeredHandler(event:Event, name:String):void
		{
			switch (name)
			{
				case InstanceNames.BTN_CONTINUE:
				{					
					dispatchWith(ApplicationEvent.PLAY);	
					break;
				}
				
				case InstanceNames.BTN_REPLAY:
				{						
					dispatchWith(ApplicationEvent.REPLAY);	
					break;
				}
				
				default:
					break;
			}
		}
		
		private function viewShowPageHandler(event:Event):void
		{
			dispatchWith(ApplicationEvent.SHOW_PAGE, false, event.data);
		}
		
		private function pageNumberChangedHandler(event:Event):void
		{
			updatePageNavigator(uint(event.data));
		}
		
		private function updatePageNavigator(currentPageNumber:uint):void
		{
			view.updatePageNavigator(currentPageNumber);
		}
		
		private function autoplayChangeHandler(event:Event):void
		{
			playbackSettings.autoplayModeEnabled = event.data;
			dispatchWith(ApplicationEvent.AUTOPLAY);
		}
		
		private function playbackSpeedChangeHandler(event:Event):void
		{
			playbackSettings.playbackSpeed = uint(event.data);
			dispatchWith(CommandEvent.UPDATE_PLAYBACK_SPEED, false, playbackSettings.playbackSpeed);
		}
	}
}