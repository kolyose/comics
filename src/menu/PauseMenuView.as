package menu
{
	import events.ViewEvent;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.PageIndicator;
	import feathers.controls.Scroller;
	import feathers.controls.Slider;
	import feathers.controls.SpinnerList;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.controls.text.BitmapFontTextRenderer;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.FeathersControl;
	import feathers.core.ITextRenderer;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	import feathers.layout.HorizontalSpinnerLayout;
	import feathers.text.BitmapFontTextFormat;
	
	import flash.text.TextFormat;
	
	import myfeathers.MySlider;
	
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class PauseMenuView extends Sprite
	{		
		private var _btnReplay		:starling.display.Button;
		private var _btnContinue	:starling.display.Button;
		private var _pageNavigator	:MySlider;
		private var _pageNavigatorLabel:Label;
		
		public function PauseMenuView()
		{
			super();
		}
		
		public function init(texturesData:PauseMenuTexturesData):void
		{
			var bgImage:Image = new Image(texturesData.bg);		
			addChild(bgImage);			
			
			_btnReplay = new starling.display.Button(texturesData.btnReplay);
			_btnReplay.x = 10;
			_btnReplay.y = 10;
			_btnReplay.name = InstanceNames.BTN_REPLAY;
			addChild(_btnReplay);
			_btnReplay.addEventListener(Event.TRIGGERED, btnTriggeredHandler);
			
			_btnContinue = new starling.display.Button(texturesData.btnContinue);
			_btnContinue.x = _btnReplay.x + _btnReplay.width + 10;
			_btnContinue.y = 10;
			_btnContinue.name = InstanceNames.BTN_CONTINUE;
			addChild(_btnContinue);
			_btnContinue.addEventListener(Event.TRIGGERED, btnTriggeredHandler);	
		}
		
		public function initPageNavigator(texturesData:Object, pagesNumber:uint):void
		{
			_pageNavigator = new MySlider();
			_pageNavigator.minimum = 0;
			_pageNavigator.maximum = pagesNumber-1;
			_pageNavigator.step = 1;
			_pageNavigator.value = 1;
			_pageNavigator.page = 1;
			_pageNavigator.thumbProperties.defaultSkin = new Image(texturesData.sliderThumbSkin);
			_pageNavigator.minimumTrackProperties.defaultSkin = new Image(texturesData.minTrackDefaultSkin);			
			_pageNavigator.addEventListener(Event.CHANGE, pagesIndicatorSliderChangeHandler);
			_pageNavigator.addEventListener(FeathersEventType.END_INTERACTION, pagesIndicatorSliderEndInteractionHandler);
			_pageNavigator.move(100, 200);
			addChild(_pageNavigator);			
					
			_pageNavigatorLabel = new Label();			
			_pageNavigatorLabel.textRendererFactory = function():ITextRenderer
			{
				//TODO: change to real bitmap font
				var textRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				textRenderer.textFormat = new TextFormat("Arial", 30);
				return textRenderer;
			}
			
			updatePagesNavigatorLabel();
			this.addChild(_pageNavigatorLabel);
		}
		
		public function updatePageNavigator(currentPageNumber:uint):void
		{
			_pageNavigator.value = currentPageNumber;
			updatePagesNavigatorLabel();
		}
		
		private function updatePagesNavigatorLabel():void
		{
			_pageNavigator.validate();
			_pageNavigatorLabel.text = _pageNavigator.value.toString();
			_pageNavigatorLabel.validate();		
			
			_pageNavigatorLabel.x = _pageNavigator.x + _pageNavigator.thumbPosition.x + (_pageNavigator.thumbProperties.defaultSkin.width - _pageNavigatorLabel.width)/2;
			_pageNavigatorLabel.y = _pageNavigator.y + _pageNavigator.thumbPosition.y - 30;
		
		}
		
		private function pagesIndicatorSliderChangeHandler(event:Event):void
		{
			updatePagesNavigatorLabel();
		}
		
		private function pagesIndicatorSliderEndInteractionHandler(event:Event):void
		{
			dispatchEventWith(ViewEvent.SHOW_PAGE, false, _pageNavigator.value);
		}		
		
		public function show():void
		{
			visible = touchable = true;
		}
		
		public function hide():void
		{
			visible = touchable = false;
		}
		
		private function btnTriggeredHandler(event:Event):void
		{
			dispatchEventWith(ViewEvent.BTN_TRIGGERED, false, (event.currentTarget as DisplayObject).name);
		}
	}
}