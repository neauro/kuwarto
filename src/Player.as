package
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source = '../assets/protag.png')] private var player:Class;
		
		public function Player()
		{
			player.makeGraphic(10,12,0xffaa1111);
			player.maxVelocity.x = 80;
			player.maxVelocity.y = 200;
			player.acceleration.y = 200;
			player.drag.x = player.maxVelocity.x*4;
			super(50,200,player);
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
			
			//Check for player lose conditions
			if(player.y > FlxG.height)
			{
				FlxG.score = 1; //sets status.text to "Aww, you died!"
				FlxG.resetState();
			}
			super.update();
		}
	}
}