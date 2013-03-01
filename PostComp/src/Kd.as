package 
{
	import org.flixel.*;

	public class Kd extends FlxSprite
	{	
		public function Kd(X:Number,Y:Number)
		{
			super(X, Y);
			loadGraphic(Registry.kd,false,false,58,26);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}