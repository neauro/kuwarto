package
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source = '../assets/protag.png')] private var player_img:Class;
		
		public function Player()
		{
			//player.makeGraphic(10,12,0xffaa1111);
			this.maxVelocity.x = 80;
			this.maxVelocity.y = 200;
			this.acceleration.y = 200;
			loadGraphic(player_img, true,true,41,53);
			addAnimation("walk", [0,1,2,3,4,5,6,7,8,9,10],25,true);
			this.drag.x = this.maxVelocity.x*4;
		}
		
		override public function update():void
		{
			play("walk");
			//Player movement and controls
			this.acceleration.x = 0;
			if(FlxG.keys.LEFT)
				this.acceleration.x = -this.maxVelocity.x*4;
			if(FlxG.keys.RIGHT)
				this.acceleration.x = this.maxVelocity.x*4;
			if(FlxG.keys.justPressed("SPACE"))
				this.velocity.y = -this.maxVelocity.y/2;
			
			//Check for player lose conditions
			if(this.y > FlxG.height)
			{
				//FlxG.score = 1; //sets status.text to "Aww, you died!"
				FlxG.resetState();
			}
			super.update();
		}
	}
}