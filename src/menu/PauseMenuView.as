package menu
{
	import events.ViewEvent;
	
	import feathers.controls.Button;
	import feathers.controls.Check;
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
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class PauseMenuView extends Sprite
	{		
		private var _btnReplay		:starling.display.Button;
		private var _btnContinue	:starling.display.Button;
		private var _pageNavigator	:MySlider;
		private var _pageNavigatorLabel:Label;
		private var _cbAutoplay:Check;
		private var _speedSelector:MySlider;
		
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
			//_btnReplay.addEventListener(TouchEvent.TOUCH, stopTouchPropagationHandler);
			
			_btnContinue = new starling.display.Button(texturesData.btnContinue);
			_btnContinue.x = _btnReplay.x + _btnReplay.width + 10;
			_btnContinue.y = 10;
			_btnContinue.name = InstanceNames.BTN_CONTINUE;
			addChild(_btnContinue);
			_btnContinue.addEventListener(Event.TRIGGERED, btnTriggeredHandler);	
			//_btnContinue.addEventListener(TouchEvent.TOUCH, stopTouchPropagationHandler);		
		}
		
		public function initAutoplayCheckbox(texturesData:Object, autoplayModeEnabled:Boolean):void
		{
			_cbAutoplay = new Check();
			_cbAutoplay.label = "Autoplay mode";
			_cbAutoplay.isSelected = autoplayModeEnabled;
			_cbAutoplay.defaultIcon = new Image(texturesData.defaultIcon);
			_cbAutoplay.defaultSelectedIcon = new Image(texturesData.defaultSelectedIcon);
			_cbAutoplay.y = 30;
			_cbAutoplay.x = _btnContinue.x + _btnContinue.width + 10;
			addChild(_cbAutoplay);
			_cbAutoplay.addEventListener(Event.CHANGE, autoplayCheckboxChangeHandler);
		}
		
		private function autoplayCheckboxChangeHandler(event:Event):void
		{
			dispatchEventWith(ViewEvent.AUTOPLAY_CHANGE, false, _cbAutoplay.isSelected);
		}
		
		public function initSpeedSelector(texturesData:Object, currentSpeed:uint, minSpeed:uint, maxSpeed:uint):void
		{
			_speedSelector = new MySlider();
			_speedSelector.minimum = minSpeed;
			_speedSelector.maximum = maxSpeed;
			_speedSelector.step = 1;
			_speedSelector.value = currentSpeed;
			_speedSelector.page = 1;
			_speedSelector.thumbProperties.defaultSkin = new Image(texturesData.sliderThumbSkin);
			_speedSelector.minimumTrackProperties.defaultSkin = new Image(texturesData.minTrackDefaultSkin);			
			_speedSelector.addEventListener(Event.CHANGE, speedSelectorChangeHandler);		
			_speedSelector.move(100, 100);
			addChild(_speedSelector);			
		}
		
		private function speedSelectorChangeHandler(event:Event):void
		{
			dispatchEventWith(ViewEvent.PLAYBACK_SPEED_CHANGE, false, _speedSelector.value);
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
			/*_pageNavigator.addEventListener(TouchEvent.TOUCH, function(event:TouchEvent):void
				{
				//TODO:
				//when TouchControls be refactored (for instance changed to Gestouch library)
				//and a GAP when a TAP event fires after some delay be removed (see the TouchControls class line 116)
				//then probably we can remove this actual GAP and remove this TOUCH handler
					event.stopImmediatePropagation();
					event.stopPropagation();
				});*/
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
		
		private function stopTouchPropagationHandler(event:TouchEvent):void
		{
			var touchEnded:Touch = event.getTouch(event.currentTarget as DisplayObject, TouchPhase.ENDED);
			if (!touchEnded || touchEnded.tapCount < 1) return;
			
			//NOTE:
			//the following GAP purposed to prevent firing of standard TOUCH event from this menu
			//in order to keep input control by this class only - but not by InputController
			//NOTE: 
			//maybe such approach is not perfect and we need to think about moving controlling role of the menu to the InputController
			//TODO:
			//when TouchControls be refactored (for instance changed to Gestouch library)
			//and a GAP when a TAP event fires after some delay be removed (see the TouchControls class line 116)
			//then probably we can remove this actual GAP and come back to button's TRIGGERED event usage
			
			event.stopImmediatePropagation();
			event.stopPropagation();
			
			dispatchEventWith(ViewEvent.BTN_TRIGGERED, false, (event.currentTarget as DisplayObject).name);
		}
	}
}