package  
{
	import flash.utils.getTimer;
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class AloneiumManager extends FlxGroup
	{
	
		public function AloneiumManager() 
		{
			super();
			
			for (var i:int = 0; i < 250; i++)
			{
				add(new Aloneium);
			}
		}
		
		public function release(x:int, y:int):void
		{
			var aloneium:Aloneium = Aloneium(getFirstAvailable());
			if (aloneium)
			{
				aloneium.drop(x,y);
			}
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}