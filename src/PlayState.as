package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		public var player:FlxSprite;
		public var test:FlxText;
		[Embed(source = "../assets/land_bg.gif")] private var background_image:Class;
		
		// tilemap
		[Embed(source = "../assets/tiles.png")] private static var alt_tiles:Class;
		[Embed(source = "../assets/tiles.txt", mimeType = "application/octet-stream")] private static var default_alt:Class;

		// Some static constants for the size of the tilemap tiles
		private const TILE_WIDTH:uint = 16;
		private const TILE_HEIGHT:uint = 16;
		
		// The FlxTilemap we're using
		private var collisionMap:FlxTilemap;
		
		override public function create():void
		{
			var bg:FlxSprite;
			bg = new FlxSprite(0, 0, background_image);
			add(bg);
			
			collisionMap = new FlxTilemap(); // Creates a new tilemap with no arguments
			// Initializes the map using the generated string, the tile images, and the tile size
			collisionMap.loadMap(new default_alt(), alt_tiles, TILE_WIDTH, TILE_HEIGHT, FlxTilemap.AUTO);
			add(collisionMap);
			
			player = new Player();
			add(player);
			
			test = new FlxText(0,0,100,"hello arupaka"); //adds a 100px wide text field at position 0,0 (upper left)
			add(test); //adds a 100px wide text field at position 0,0 (upper left)
		}
		
		override public function update():void
		{
			// test.text = player.velocity.x + "," + player.velocity.y;
			FlxG.collide(player, collisionMap);

			super.update();
		}
	}
}