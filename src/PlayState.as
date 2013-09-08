package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		public var player:FlxSprite;
		[Embed(source = "../assets/land_bg.gif")] private var background_image:Class;
		
		override public function create():void
		{
			var bg:FlxSprite;
			bg = new FlxSprite(0, 0, background_image);
			add(bg);
			
			player = new Player();
			add(player);
			
			add(new FlxText(0,0,100,"hello arupaka")); //adds a 100px wide text field at position 0,0 (upper left)
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}