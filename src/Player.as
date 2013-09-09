package
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source = '../assets/protag.png')] private var player_img:Class;
		private var bottom = FlxG.height-70;
		
		public function Player()
		{
			//player.makeGraphic(10,12,0xffaa1111);
			this.maxVelocity.x = 80;
			this.maxVelocity.y = 200;
			this.acceleration.y = 200;
			this.facing = LEFT;
			loadGraphic(player_img, true,true,41,53);
			addAnimation("walk", [0,1,2,3,4,5,6,7,8,9,10],25,true);
			addAnimation("idle", [0,11,12,13,14,15,16,17,18,19,20],25,true);
			this.drag.x = this.maxVelocity.x*4;
		}
		
		override public function update():void
		{
			if (this.velocity.x > 0 || this.velocity.y > 0) {
				play("walk");
			}
			else {
				play("idle");
			}
			
			this.acceleration.x = 0;
			if (FlxG.keys.LEFT) {
				this.facing = RIGHT;
				this.acceleration.x = -this.maxVelocity.x*4;
			}
			if (FlxG.keys.RIGHT) {
				this.facing = LEFT;
				this.acceleration.x = this.maxVelocity.x*4;
			}
			if (FlxG.keys.justPressed("SPACE"))
				this.velocity.y = -this.maxVelocity.y/2;
			
			super.update();
			
			//Check for player lose conditions
			if(this.y > bottom)
			{
				//FlxG.score = 1; //sets status.text to "Aww, you died!"
				//FlxG.resetState();
				this.y = bottom;
				play("idle");
			}
			
		}
	}
}