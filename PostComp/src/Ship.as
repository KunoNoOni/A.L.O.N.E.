package 
{
	import org.flixel.*;

	public class Ship extends FlxSprite
	{	
		public function Ship(X:Number,Y:Number)
		{
			super(X*16, Y*16);
			loadGraphic(Registry.ship,true,true,16,16);
			addAnimation("flying",[0,1],10);	
		}
		
		override public function update():void
		{

			this.play("flying");
			super.update();
		}
	}
}