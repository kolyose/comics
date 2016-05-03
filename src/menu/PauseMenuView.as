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
		private var _pagesIndicatorsSlider	:MySlider;
		private var _pagesIndicatorLabel:Label;
		
		public function PauseMenuView()
		{
			super();
		}
		
		public function init(texturesData:PauseMenuTexturesData):void
		{
			var bgImage:Image = new Image(texturesData.bg);			
			//bgImage.name = InstanceNames.PAUSE_MENU_BG;
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
		
		public function initPageIndicator(texturesData:Object, pagesNumber:uint):void
		{
			_pagesIndicatorsSlider = new MySlider();
			_pagesIndicatorsSlider.minimum = 0;
			_pagesIndicatorsSlider.maximum = pagesNumber;
			_pagesIndicatorsSlider.step = 1;
			_pagesIndicatorsSlider.value = 1;
			_pagesIndicatorsSlider.page = 1;
			_pagesIndicatorsSlider.thumbProperties.defaultSkin = new Image(texturesData.sliderThumbSkin);
			_pagesIndicatorsSlider.minimumTrackProperties.defaultSkin = new Image(texturesData.minTrackDefaultSkin);			
			_pagesIndicatorsSlider.addEventListener(Event.CHANGE, pagesIndicatorSliderChangeHandler);
			_pagesIndicatorsSlider.addEventListener(FeathersEventType.END_INTERACTION, pagesIndicatorSliderEndInteractionHandler);
			_pagesIndicatorsSlider.move(0, 100);
			addChild(_pagesIndicatorsSlider);			
					
			_pagesIndicatorLabel = new Label();			
			_pagesIndicatorLabel.textRendererFactory = function():ITextRenderer
			{
				//TODO: change to real bitmap font
				var textRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				textRenderer.textFormat = new TextFormat("Arial", 30);
				return textRenderer;
			}
			
			updatePagesIndicatorLabel();
			this.addChild(_pagesIndicatorLabel);
		}
		
		private function updatePagesIndicatorLabel():void
		{
			_pagesIndicatorsSlider.validate();
			_pagesIndicatorLabel.text = _pagesIndicatorsSlider.value.toString();
			_pagesIndicatorLabel.validate();		
			
			_pagesIndicatorLabel.x = _pagesIndicatorsSlider.x + _pagesIndicatorsSlider.thumbPosition.x + _pagesIndicatorsSlider.thumbProperties.defaultSkin.width/2 - _pagesIndicatorLabel.width/2;
			_pagesIndicatorLabel.y = _pagesIndicatorsSlider.y + _pagesIndicatorsSlider.thumbPosition.y - 30;
		
		}
		
		private function pagesIndicatorSliderChangeHandler(event:Event):void
		{
			updatePagesIndicatorLabel();
		}
		
		private function pagesIndicatorSliderEndInteractionHandler(event:Event):void
		{
			
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