package 
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Player extends FlxSprite
	{	
		private var bulletBounds:FlxRect;
		
		public function Player(X:Number,Y:Number)
		{
			super(X,Y);
			loadGraphic(Registry.alien,true,false,16,16);
			addAnimation("walking",[0,1,0,2],10);
			addAnimation("standing",[0],10);
			
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			FlxControl.create(this, FlxControlHandler.MOVEMENT_INSTANT, FlxControlHandler.STOPPING_DECELERATES, 1, false, false);
			FlxControl.player1.setCursorControl(false,false,true,true);		
			FlxControl.player1.setMovementSpeed(100, 1600, 100, 1700, 100, 0);
			FlxControl.player1.setGravity(0,1700);
			bulletBounds = new FlxRect(0,0,400,400);
			Registry.wep = new FlxWeapon("lazer",this,"x","y");
			Registry.wep.makeImageBullet(50,Registry.bullet,0,4);
			Registry.wep.setBulletBounds(bulletBounds);
			FlxControl.player1.setFireButton("Z",FlxControlHandler.KEYMODE_PRESSED,250,Registry.wep.fire);
			FlxControl.player1.setBounds(0,0,384,400);
			FlxControl.player1.setJumpButton("SPACE", FlxControlHandler.KEYMODE_PRESSED, 1700, FlxObject.FLOOR, 250);
		}
		
		override public function update():void
		{		
			super.update();
			
			if(FlxG.keys.justPressed("Z"))
			{
				FlxG.play(Registry.shoot,2);
			}
			if(FlxG.keys.justPressed("LEFT"))
			{
				Registry.wep.setBulletDirection(FlxWeapon.BULLET_LEFT,200);
			}
			if(FlxG.keys.justPressed("RIGHT"))
			{
				Registry.wep.setBulletDirection(FlxWeapon.BULLET_RIGHT,200);
			}
			if (touching == FlxObject.FLOOR)
			{
				if (velocity.x != 0)
				{
					play("walking");
				}
				else
				{
					play("standing");
				}
			}
			if(FlxG.keys.justPressed("SPACE") && (touching == FlxObject.FLOOR))
			{
				FlxG.play(Registry.jump,2);
			}
			if (velocity.y != 0)
			{
				play("standing");
				
			}
		}
	}
}