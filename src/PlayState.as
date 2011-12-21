package
{
	import flash.display.Sprite;
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		//Variables go here
		private var level:FlxTilemap;
		private var player:Player = new Player(50,350);
		private var emitter:FlxEmitter;
		private var num:int;
		private var hud:FlxText;
		private var counter:Number = 0;
		private var lives:FlxText;
		
				
		override public function create():void
		{	
			Registry.init();
			Registry.GameOver = false;
			level = new FlxTilemap();
			level.loadMap(new Registry.level,Registry.buildTile,16,16,0,0,1,3);
			add(level);
			showHUD();
			add(Registry.enemys);
			add(Registry.aloneiums);
			add(Registry.wep.group);
			add(player);
		}	
		
		override public function update():void
		{
			if(Registry.playerDead)
			{
				counter += FlxG.elapsed;
				if(counter >=1)
				{
					resetWave();
				}
			}
			
			if(Registry.metal >= Registry.aloneiumNeeded)
			{
				FlxG.flash(0xffffffff,1);
				missionComplete();
			}
			
			FlxG.overlap(player, Registry.enemys, killPlayer);
			FlxG.overlap(Registry.wep.group, Registry.enemys, killEnemy);
			FlxG.overlap(player, Registry.aloneiums, pickupMetal);
			
			super.update();
			
			
			FlxG.collide(level, player);
			FlxG.collide(level, Registry.enemys);
			FlxG.collide(level, Registry.aloneiums);
			
		}
		
		private function showHUD():void
		{
			hud = new FlxText(0,380, 150, "Aloneium: " + Registry.metal.toString());
			hud.setFormat(null,10,0xFFFFFF, "left");
			add(hud);
			lives = new FlxText(350,380, 150, "Lives: " + Registry.lives.toString());
			lives.setFormat(null,10,0xFFFFFF, "left");
			add(lives);
		}
		
		private function killPlayer(p:FlxSprite, e:FlxSprite):void
		{
			FlxG.play(Registry.hit);
			p.kill();
			Registry.playerDead = true;
			Registry.lives -= 1;
			lives.text = "Lives: " +Registry.lives.toString();
			emitter = new FlxEmitter(e.x,e.y);
			emitter.setXSpeed(-20,20);
			emitter.setYSpeed(-30,0);
			emitter.gravity = 100;
			emitter.makeParticles(Registry.blood,10,0,true,.5);
			add(emitter);
			emitter.start(true,3);
			Registry.enemyKilled = 0;
			Registry.metal = 0;
			Registry.enemyVelocity = 50;
		}
		private function killEnemy(b:FlxSprite, e:FlxSprite):void
		{

			FlxG.play(Registry.hit);
			b.kill();
			num = FlxG.random()*100+1;
			e.kill();
			Registry.enemyKilled += 1;
			if(Registry.enemyKilled % 50 == 0)
			{
				Registry.enemyVelocity += 50;
			}
			if(num % 2 == 0)
			{
				Registry.aloneiums.release(e.x,e.y);
			}
			emitter = new FlxEmitter(e.x,e.y);
			emitter.setXSpeed(-20,20);
			emitter.setYSpeed(-30,0);
			emitter.gravity = 100;
			emitter.makeParticles(Registry.blood,10,0,true,.5);
			add(emitter);
			emitter.start(true,3);	
		}
		
		private function pickupMetal(p:FlxSprite, metal:FlxSprite):void
		{
			metal.kill();
			FlxG.play(Registry.pc);
			Registry.metal += 1;
			hud.text = "Aloneium: " +Registry.metal.toString();
		}
		
		private function resetWave():void
		{	
			if(Registry.lives < 0)
			{
				FlxG.switchState(new GameOverState());
			}
			else if(Registry.playerDead)
			{
				Registry.playerDead = false;
				FlxG.resetState();
			}
		}
		
		private function missionComplete():void
		{
			
			Registry.enemys.setAll("exists",false);	
			Registry.wonGame = true;
			counter += FlxG.elapsed;
			if(counter >=1)
			{
				FlxG.switchState(new GameOverState());
			}
			
		}
	}
}
