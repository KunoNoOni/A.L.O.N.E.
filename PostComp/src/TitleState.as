package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;
		
	public class TitleState extends FlxState
	{
		//Variables got here
		private var stars:FlxSprite;
		private var starfield:StarfieldFX;
		private var ship:Ship;
		private var kd:Kd;
		private var code:Array = new Array;
		
		public function TitleState()
		{
			super();
		}
		
		override public function create():void
		{
			if (FlxG.getPlugin(FlxSpecialFX) == null)
			{
				FlxG.addPlugin(new FlxSpecialFX);
			}
			
			starfield = FlxSpecialFX.starfield();
			starfield.setStarSpeed(-2, 0);
			stars = starfield.create(0, 0, FlxG.width, FlxG.height, 200);
			add(stars);
			
			var title:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height*0.5-200, 300, "A.L.O.N.E.");
			title.setFormat(null,50,0x00FF00, "center");
			add(title);
			
			var A:FlxText = new FlxText(FlxG.width*0.5-180,FlxG.height*0.5-140, 10, "A");
			A.setFormat(null,20,0xFF0000, "center");
			add(A);
			
			var lien:FlxText = new FlxText(FlxG.width*0.5-173,FlxG.height*0.5-140, 50, "lien");
			lien.setFormat(null,20,0x00FF00, "center");
			add(lien);
			
			var L:FlxText = new FlxText(FlxG.width*0.5-120,FlxG.height*0.5-140, 10, "L");
			L.setFormat(null,20,0xFF0000, "center");
			add(L);
			
			var ifeform:FlxText = new FlxText(FlxG.width*0.5-115,FlxG.height*0.5-140, 100, "ifeform");
			ifeform.setFormat(null,20,0x00FF00, "center");
			add(ifeform);
			
			var O:FlxText = new FlxText(FlxG.width*0.5-15,FlxG.height*0.5-140, 10, "O");
			O.setFormat(null,20,0xFF0000, "center");
			add(O);
			
			var n:FlxText = new FlxText(FlxG.width*0.5-3,FlxG.height*0.5-140, 10, "n");
			n.setFormat(null,20,0x00FF00, "center");
			add(n);
			
			var N:FlxText = new FlxText(FlxG.width*0.5+15,FlxG.height*0.5-140, 10, "N");
			N.setFormat(null,20,0xFF0000, "center");
			add(N);
			
			var eolithic:FlxText = new FlxText(FlxG.width*0.5+20,FlxG.height*0.5-140, 100, "eolithic");
			eolithic.setFormat(null,20,0x00FF00, "center");
			add(eolithic);
			
			var E:FlxText = new FlxText(FlxG.width*0.5+120,FlxG.height*0.5-140, 10, "E");
			E.setFormat(null,20,0xFF0000, "center");
			add(E);
			
			var arth:FlxText = new FlxText(FlxG.width*0.5+105,FlxG.height*0.5-140, 100, "arth");
			arth.setFormat(null,20,0x00FF00, "center");
			add(arth);
			
			var instruct:FlxText = new FlxText(FlxG.width*0.5-62,FlxG.height-65, 125, "PRESS [x] TO START");
			instruct.setFormat(null,10,0xFFFFFF, "center");
			add(instruct);
			
			var cmds:FlxText = new FlxText(FlxG.width*0.5-170,FlxG.height-50, 350, "Arrow Keys to MOVE | Space to JUMP | Control to Fire");
			cmds.setFormat(null,10,0xFF0000, "center");
			add(cmds);	
			
			var enter:FlxText = new FlxText(290,360, 125, "enter = start");
			enter.setFormat(null,10,0x333333, "center");
			add(enter);
			
			ship = new Ship(12,12);
			add(ship);
			
			kd = new Kd(0,354);
			add(kd);
			
			FlxG.playMusic(Registry.at,.8);
		}
		
		override public function update():void
		{
		
			if(FlxG.keys.justReleased("UP"))
			{
				trace("UP");
				code.push("38").toString();
			}
			if(FlxG.keys.justReleased("DOWN"))
			{
				trace("DOWN");
				code.push("40").toString();
			}
			if(FlxG.keys.justReleased("LEFT"))
			{
				trace("LEFT");
				code.push("37").toString();
			}
			if(FlxG.keys.justReleased("RIGHT"))
			{
				trace("RIGHT");
				code.push("39").toString();
			}
			if(FlxG.keys.justReleased("B"))
			{
				trace("B");
				code.push("66").toString();
			}
			if(FlxG.keys.justReleased("A"))
			{
				trace("A");
				code.push("65").toString();
			}
			if(FlxG.keys.justReleased("ENTER"))
			{
				trace("ENTER");
				code.push("13").toString();
			}

			if(code.length > 11)
			{
				code = [];
			}
			else
			{	
				if(code.toString() == "38,38,40,40,37,39,37,39,66,65,13" && !Registry.kc)
				{
					FlxG.play(Registry.pc);
					Registry.kc = true;
				}
			}
			
			if(FlxG.keys.X)
				FlxG.switchState(new IntroState());	
			
			super.update();
		}
		
		override public function destroy():void
		{
			starfield = null;
		}
	}
}