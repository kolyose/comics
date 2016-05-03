package myfeathers
{
	import feathers.controls.Slider;
	
	import flash.geom.Point;
	
	public class MySlider extends Slider
	{
		public function MySlider()
		{
			super();
		}
		
		public function get thumbPosition():Point
		{
			return new Point(thumb.x, thumb.y);
		}
	}
}