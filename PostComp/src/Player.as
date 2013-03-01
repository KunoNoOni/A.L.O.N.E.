package 
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import flash.utils.getTimer;
	
	public class Player extends FlxSprite
	{	
		private var bulletBounds:FlxRect;
		
		public function Player(X:Number,Y:Number)
		{
			super(X,Y);
			loadGraphic(Registry.alien,true,false,16,16);
			addAnimation("walking",[0,1,0,2],10,true);
			addAnimation("standing",[0],0,false);
			addAnimation("jumping",[3],0,false);
			
			this.maxVelocity.x = 100;
			this.maxVelocity.y = 450;
			this.acceleration.y = 450;
						
			bulletBounds = new FlxRect(0,0,400,400);
			Registry.wep = new FlxWeapon("lazer",this,"x","y");
			Registry.wep.makeImageBullet(50,Registry.bullet,8,4);
			Registry.wep.setBulletBounds(bulletBounds);
		}
		
		override public function update():void
		{		
			super.update();
	
			this.velocity.x = 0;
			
			if(FlxG.keys.LEFT && x>0 )
			{
				this.facing = LEFT;
				this.velocity.x = -this.maxVelocity.x;
			}
			
			if(FlxG.keys.RIGHT && x < FlxG.width - width)
			{
				this.facing = RIGHT;
				this.velocity.x = this.maxVelocity.x;
			}
			
			if(FlxG.keys.justPressed('SPACE') && Registry.onGround)
			{
				FlxG.play(Registry.jump,.2);
				this.velocity.y = -this.maxVelocity.y/2;
			}
			
			if(FlxG.keys.justPressed("CONTROL"))
			{
				FlxG.play(Registry.shoot,2);
				if(facing == LEFT)
				{
					Registry.wep.setBulletDirection(FlxWeapon.BULLET_LEFT,150);
				}
				else
				{
					Registry.wep.setBulletDirection(FlxWeapon.BULLET_RIGHT,150);
				}
				Registry.wep.fire();
			}
			
			if(x<0)
			{
				x=0;
			}
			else if(x>FlxG.width - width)
			{
				x=FlxG.width - width;
			}
			
			if(this.velocity.y != 0)
			{
				this.play("jumping");
			}
			else if(this.velocity.x == 0)
			{
				this.play("standing");
				Registry.onGround = true;
			}
			else
			{
				this.play("walking");
				Registry.onGround = true;
			}
		}	
	}
}	