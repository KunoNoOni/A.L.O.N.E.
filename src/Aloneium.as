package
{
	import org.flixel.*;
	
	public class Aloneium extends FlxSprite
	{
		public function Aloneium()
		{
			super();
			loadGraphic(Registry.aloneium,false,false,8,8);
			exists = false;
		}
		
		public function drop(x:int, y:int):void
		{
			this.x = x;
			this.y = y;
			acceleration.y = 500
			exists = true;
		}

		
		override public function update():void
		{
			super.update();
		}
	}
}