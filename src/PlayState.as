package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		public var player:FlxSprite;
		public var test:FlxText;
		public var magnetObj:MagnetObj;
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
			
			collisionMap = new FlxTilemap().loadMap(new default_alt(), alt_tiles, TILE_WIDTH, TILE_HEIGHT, FlxTilemap.AUTO);
			add(collisionMap);
			
			player = new Player(FlxG.width/2, FlxG.height/2);
			add(player);
			
			magnetObj = new MagnetObj(50,100);
			add(magnetObj);
			
			test = new FlxText(FlxG.width/2,50,100,"hello arupaka"); //adds a 100px wide text field at position 0,0 (upper left)
			add(test); //adds a 100px wide text field at position 0,0 (upper left)
		}
		
		private function seeMagnet():Boolean
		{
			return true; 
		}
		
		override public function update():void
		{
			// test.text = player.velocity.x + "," + player.velocity.y;
			FlxG.collide(player, collisionMap);
			// FlxG.collide(magnetObj, collisionMap);
			
			if (FlxG.keys.M) {
				if (seeMagnet()) {
					test.text = player.y + "," + magnetObj.y;
					magnetObj.velocity.x = 50;
				}
				
			}

			super.update();
		}
	}
}