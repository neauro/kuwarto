package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		public var player:FlxSprite;
		public var test:FlxText;
		[Embed(source = "../assets/land_bg.gif")] private var background_image:Class;
		
		override public function create():void
		{
			var bg:FlxSprite;
			bg = new FlxSprite(0, 0, background_image);
			add(bg);
			
			player = new Player();
			add(player);
			
			test = new FlxText(0,0,100,"hello arupaka"); //adds a 100px wide text field at position 0,0 (upper left)
			add(test); //adds a 100px wide text field at position 0,0 (upper left)
		}
		
		override public function update():void
		{
			// test.text = player.velocity.x + "," + player.velocity.y;

			super.update();
		}
	}
}