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
			
			var texturesData:PauseMenuTexturesData = new PauseMenuTexturesData();
			texturesData.bg = assetsModel.getTexture("pauseMenuBg"); 
			texturesData.btnReplay = assetsModel.getTexture("replayButton");
			texturesData.btnContinue = assetsModel.getTexture("playButton");
			view.init(texturesData);
			
			var pageIndicatorTextures:Object = {};
			pageIndicatorTextures.sliderThumbSkin = assetsModel.getTexture("pagesSliderThumbSkin");
			pageIndicatorTextures.minTrackDefaultSkin = assetsModel.getTexture("pagesSliderTrackSkin");
			view.initPageIndicator(pageIndicatorTextures, Settings.getInstance().intPagesCount);
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
	}
}