package
{
	import org.flixel.*;
	
	public class Enemy extends FlxSprite
	{
		public function Enemy()
		{
			super();
			if(Registry.kc)
			{
				loadGraphic(Registry.kitten,true,true,16,16);
				facing = RIGHT;
				addAnimation("walking",[0,1],10);	
			}
			else
			{
				loadGraphic(Registry.caveman,true,false,16,16);
				addAnimation("walking",[0,1,0,2],10);	
			}
			
			exists = false;
		}

		public function launch():void
		{
			x = 0;
			y = -5;
			velocity.x = Registry.enemyVelocity;
			acceleration.y = 500
			exists = true;
		}
		
		override public function update():void
		{
			super.update();
			
			play("walking");
			
			if (x > 380)
			{
				velocity.x = -Registry.enemyVelocity;
				if(Registry.kc)
				{
					facing = RIGHT;
				}
			}
			
			if (x < 1)
			{
				velocity.x = Registry.enemyVelocity;;
				if(Registry.kc)
				{
					facing = LEFT;
				}
			}
			
			if (velocity.x == 0)
			{
				velocity.x = Registry.enemyVelocity;
			}
		}
	}
}