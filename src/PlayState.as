package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		public var player:FlxSprite;
		
		override public function create():void
		{
			//Create player (a red box)
			player = new FlxSprite(FlxG.width/2 - 5);
			player.makeGraphic(10,12,0xffaa1111);
			player.maxVelocity.x = 80;
			player.maxVelocity.y = 200;
			player.acceleration.y = 200;
			player.drag.x = player.maxVelocity.x*4;
			add(player);
			
			add(new FlxText(0,0,100,"Hello, World!")); //adds a 100px wide text field at position 0,0 (upper left)
		}
		
		override public function update():void
		{
			//Player movement and controls
			player.acceleration.x = 0;
			if(FlxG.keys.LEFT)
				player.acceleration.x = -player.maxVelocity.x*4;
			if(FlxG.keys.RIGHT)
				player.acceleration.x = player.maxVelocity.x*4;
			if(FlxG.keys.justPressed("SPACE"))
				player.velocity.y = -player.maxVelocity.y/2;
			
			//Updates all the objects appropriately
			super.update();
			
			//Check for player lose conditions
			if(player.y > FlxG.height)
			{
				FlxG.score = 1; //sets status.text to "Aww, you died!"
				FlxG.resetState();
			}
		}
	}
}