package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class Registry
	{
		public static var kc:Boolean = false;
		public static var wep:FlxWeapon;
		public static var enemys:EnemyManager;
		public static var aloneiums:AloneiumManager;
		public static var metal:int = 0;
		public static var numEnemy:int = 10;
		public static var enemyVelocity:int = 50;
		public static var aloneiumNeeded:int = 250;
		public static var enemyKilled:int = 0;
		public static var playerDead:Boolean = false;
		public static var lives:Number;
		public static var GameOver:Boolean = true;
		public static var wonGame:Boolean = false;

		[Embed(source = 'Sprites/buildTile.png')] static public var buildTile:Class;
		[Embed(source = 'Sprites/alien.png')] static public var alien:Class;
		[Embed(source = 'Sprites/aloneium.png')] static public var aloneium:Class;
		[Embed(source = 'Sprites/bullet.png')] static public var bullet:Class;
		[Embed(source = 'Sprites/caveman.png')] static public var caveman:Class;
		[Embed(source = 'Sprites/kitten.png')] static public var kitten:Class;
		[Embed(source = 'Sprites/ship.png')] static public var ship:Class;
		[Embed(source = 'Sprites/kittendare.png')] static public var kd:Class;
		[Embed(source = 'Sprites/blood.png')] static public var blood:Class;
			
		[Embed(source = 'Maps/mapCSV_Group1_Map1.csv', mimeType = 'application/octet-stream')] static public var level:Class;
		
		[Embed(source = 'Sounds/Jump.mp3')] static public var jump:Class;
		[Embed(source = 'Sounds/Hit_Hurt.mp3')] static public var hit:Class;
		[Embed(source = 'Sounds/Laser_Shoot.mp3')] static public var shoot:Class;
		[Embed(source = 'Sounds/Pickup_Coin.mp3')] static public var pc:Class;
		
		
		public function Registry()
		{
		}
		
		public static function init():void
		{
			enemys = new EnemyManager;
			aloneiums = new AloneiumManager;
			
			if(GameOver)
			{
				lives = 5;	
			}
		}
	}
}