package controls.factory
{
	import controls.IControls;
	import controls.TouchControls;
	
	import org.robotlegs.starling.mvcs.Actor;
	
	import starling.display.DisplayObject;
	
	public class BaseControlsFactory extends Actor implements IControlsFactory
	{
		protected var _builder:IControlsBuilder;
		
		public function BaseControlsFactory()
		{
			super();
		}
		
		public function getControls(stage:DisplayObject):IControls
		{
			createControls(getBuilder(), stage);
			return _builder.getControls();
		}
		
		protected function createControls(builder:IControlsBuilder, stage:DisplayObject):void
		{
			_builder = builder;			
			_builder.createControls(stage);
			_builder.initControls();
			_builder.enableControls();
		}
		
		public function getBuilder():IControlsBuilder
		{
			return new BaseControlsBuilder();
		}
	}
}