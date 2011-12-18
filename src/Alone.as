package
{
	import org.flixel.*;
	
	[SWF(width="800", height="800", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
		
	public class Alone extends FlxGame
	{
		public function Alone()
		{
			super(400,400,TitleState,2);
			//forceDebugger = true;
			//FlxG.visualDebug = true;
			//FlxG.debug = true;
		}
	}
}