package
{
	import org.flixel.*;
	
	public class Enemy extends FlxSprite
	{
		public static var Health:int = Registry.enemyHealth;
		
		public function Enemy()
		{
			super();
			if(Registry.kc)
			{
				loadGraphic(Registry.kitten,true,true,16,16);
				addAnimation("walking",[0,1,2],10);	
			}
			else
			{
				loadGraphic(Registry.caveman,true,false,16,16);
				addAnimation("walking1",[0,1,0,2],10);
				addAnimation("walking2",[3,4,3,5],10);
				addAnimation("walking3",[6,7,6,8],10);
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
			
			if(Registry.enemyKilled <= 150)
			{
				if(Registry.kc)
				{
					play("walking");	
				}
				else
				{
					play("walking1");
				}
			}
			else if(Registry.enemyKilled >150 && Registry.enemyKilled <=300 && Registry.enemyKilled % Registry.numEnemy == 0)
			{
				Registry.enemyHealth = 2;
				if(Registry.kc)
				{
					play("walking");	
				}
				else
				{
					play("walking2");
				}
			}
			else if(Registry.enemyKilled >300 && Registry.enemyKilled % Registry.numEnemy == 0)
			{
				Registry.enemyHealth = 4;
				if(Registry.kc)
				{
					play("walking");	
				}
				else
				{
					play("walking3");
				}
			}
			
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