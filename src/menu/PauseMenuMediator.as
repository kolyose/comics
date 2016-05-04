package menu
{
	import events.ApplicationEvent;
	import events.ModelEvent;
	import events.ViewEvent;
	
	import model.assets.AssetsModel;
	
	import org.robotlegs.starling.mvcs.Mediator;
	
	import starling.events.Event;
	
	public class PauseMenuMediator extends Mediator
	{
		[Inject]
		public var view:PauseMenuView;
		
		[Inject]
		public var assetsModel:AssetsModel;
		
		//[Inject]
		//public var 
		
		public function PauseMenuMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			addViewListener(ViewEvent.BTN_TRIGGERED, btnTriggeredHandler);
			addViewListener(ViewEvent.SHOW_PAGE, viewShowPageHandler);
			
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
		}
		
		private function btnTriggeredHandler(event:Event, name:String):void
		{
			switch (name)
			{
				case InstanceNames.BTN_CONTINUE:
				{
					dispatchWith(ApplicationEvent.UNLOCK);
					dispatchWith(ApplicationEvent.RESUME);	
					break;
				}
				
				case InstanceNames.BTN_REPLAY:
				{
					dispatchWith(ApplicationEvent.UNLOCK);
					dispatchWith(ApplicationEvent.PLAY);	
					break;
				}
				
				default:
					break;
			}
		}
		
		private function viewShowPageHandler(event:Event):void
		{
			dispatchWith(ModelEvent.SHOW_PAGE, false, event.data);
		}
		
		private function pageNumberChangedHandler(event:Event):void
		{
			updatePageNavigator(uint(event.data));
		}
		
		private function updatePageNavigator(currentPageNumber:uint):void
		{
			view.updatePageNavigator(currentPageNumber);
		}
	}
}