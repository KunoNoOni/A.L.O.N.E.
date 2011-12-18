package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import flash.utils.getTimer;

	public class EnemyManager extends FlxGroup
	{
		private var lastReleased:int;
		private var releaseRate:int = 500;
		
		public function EnemyManager() 
		{
			super();
			
			for (var i:int = 0; i < Registry.numEnemy; i++)
			{
				add(new Enemy);
			}
		}
		
		public function release():void
		{
			var enemy:Enemy = Enemy(getFirstAvailable());
			if (enemy)
			{
				enemy.launch();
			}
		}
		
		override public function update():void
		{
			super.update();
			
			if (getTimer() > lastReleased + releaseRate)
			{
				lastReleased = getTimer();
				release();
			}
		}
	}
}