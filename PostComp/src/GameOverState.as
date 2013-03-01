package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;

	public class GameOverState extends FlxState
	{
		private var starfield:StarfieldFX;
		private var stars:FlxSprite;
		private var ship:Ship;
		private var gameOver:FlxText;
		private var playAgain:FlxButtonPlus;
		
		public function GameOverState() 
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			
			FlxG.playMusic(Registry.at,.8);
			if(!Registry.wonGame)
			{	
				if (FlxG.getPlugin(FlxSpecialFX) == null)
				{
					FlxG.addPlugin(new FlxSpecialFX);
				}
				
				starfield = FlxSpecialFX.starfield();
				starfield.setStarSpeed(-2, 0);
				stars = starfield.create(0, 0, FlxG.width, FlxG.height, 200);
				add(stars);
			
				gameOver = new FlxText(0, 48, 400, "GAME OVER");
				gameOver.alignment = "center";
				gameOver.size = 60;
				gameOver.alpha = 0.7;
				gameOver.color = 0xFF0080;
			
				playAgain = new FlxButtonPlus(0, 208, startGame, null, "Start Over");
				playAgain.screenCenter();
			
				add(stars);
				add(gameOver);
				add(playAgain);
			
				FlxG.mouse.show();
			}
			else
			{
				if (FlxG.getPlugin(FlxSpecialFX) == null)
				{
					FlxG.addPlugin(new FlxSpecialFX);
				}
				
				starfield = FlxSpecialFX.starfield();
				starfield.setStarSpeed(-2, 0);
				stars = starfield.create(0, 0, FlxG.width, FlxG.height, 200);
				add(stars);
				
				ship = new Ship(12,16);
				add(ship);
				
				gameOver = new FlxText(0, 10, 400, "Having collected all the Aloneium you will need, You hurry back to your ship before any more hostile beings approach. Blasting off, You travel the unknown looking for more of your kind... Hopefully you'll find some so you can stop being ALONE!");
				gameOver.alignment = "center";
				gameOver.size = 20;
				gameOver.alpha = 0.7;
				gameOver.color = 0x00FF00;
				
				playAgain = new FlxButtonPlus(0, 330, startGame, null, "Start Over");
				playAgain.screenCenter();
				
				add(stars);
				add(gameOver);
				add(playAgain);
				
				FlxG.mouse.show();
			}
		}
		
		private function startGame():void
		{
			FlxG.mouse.hide();
			
			Registry.GameOver = true;
			Registry.playerDead = false;
			Registry.kc = false;
			Registry.metal = 0;
			Registry.numEnemy = 10;
			Registry.enemyVelocity = 50;
			Registry.enemyKilled = 0;
			Registry.aloneiumNeeded = 250;
			Registry.enemyHealth = 1;
			Registry.wonGame = false;
			
			FlxG.switchState(new TitleState());
		}
		
		override public function destroy():void
		{
			FlxSpecialFX.clear();
			super.destroy();
		}
	}
}