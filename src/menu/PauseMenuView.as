package menu
{
	import events.ViewEvent;
	
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class PauseMenuView extends Sprite
	{		
		private var _btnReplay		:Button;
		private var _btnContinue	:Button;
		
		public function PauseMenuView()
		{
			super();
		}
		
		public function init(texturesData:PauseMenuTexturesData):void
		{
			var bgImage:Image = new Image(texturesData.bg);			
			//bgImage.name = InstanceNames.PAUSE_MENU_BG;
			addChild(bgImage);			
			
			_btnReplay = new Button(texturesData.btnReplay);
			_btnReplay.x = 10;
			_btnReplay.y = 10;
			_btnReplay.name = InstanceNames.BTN_REPLAY;
			addChild(_btnReplay);
			_btnReplay.addEventListener(Event.TRIGGERED, btnTriggeredHandler);
			
			_btnContinue = new Button(texturesData.btnContinue);
			_btnContinue.x = _btnReplay.x + _btnReplay.width + 10;
			_btnContinue.y = 10;
			_btnContinue.name = InstanceNames.BTN_CONTINUE;
			addChild(_btnContinue);
			_btnContinue.addEventListener(Event.TRIGGERED, btnTriggeredHandler);
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