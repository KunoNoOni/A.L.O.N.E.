package
{
	import org.flixel.*;
		
	public class IntroState extends FlxState
	{
		//Variables got here
		private var text:String;

		public function IntroState()
		{
			super();
		}
		
		override public function create():void
		{
			text = "Log entry 00011: Its been a long trip... I cannot believe I'm the last of my kind... I'm all alone..." +
				"\n\nLog Entry 00101: My kon'ami core of diluted ether is almost empty. Need to find somemore Aloneium." +
				"\n\nLog Entry 00111: Found a nice suppy of Aloneium on a blue planet in what is called the sol system, going to investigate." +
				"\n\nLog Entry 01001: There is a hostile race of beings on this planet living near the largest supply of Aloneium. Looks like I will have to fight to get the 250 Aloneium I need...";
				
			var intro:FlxText = new FlxText(FlxG.width*0.5-175,FlxG.height*0.5-200, 350, text);
			intro.setFormat(null,15,0xFFFF00, "center");
			add(intro);
			
			var instruct:FlxText = new FlxText(FlxG.width*0.5-75,FlxG.height-30, 150, "PRESS [x] TO CONTINUE");
			instruct.setFormat(null,10,0xFFFFFF, "center");
			add(instruct);
				
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new PlayState());
			
			super.update();
		}
	}
}