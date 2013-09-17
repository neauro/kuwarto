package
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source = '../assets/protag.png')] private var player_img:Class;
		
		public function Player(x:Number, y:Number)
		{
			this.maxVelocity.x = 80;
			this.maxVelocity.y = 200;
			this.acceleration.y = 200;
			this.facing = LEFT;
			this.x = x;
			this.y = y;

			loadGraphic(player_img, true,true,41,53);
			addAnimation("walk", [0,1,2,3,4,5,6,7,8,9,10],25,true);
			addAnimation("idle", [0,11,12,13,14,15,16,17,18,19,20],5,true);
			this.drag.x = this.maxVelocity.x*4;
			play("idle");
		}
		
		override public function update():void
		{
			this.acceleration.x = 0;
			if (FlxG.keys.LEFT) {
				this.facing = RIGHT;
				this.acceleration.x = -this.maxVelocity.x*4;
			}
			if (FlxG.keys.RIGHT) {
				this.facing = LEFT;
				this.acceleration.x = this.maxVelocity.x*4;
			}
			
			if (FlxG.keys.justPressed("SPACE")) {
				this.velocity.y = -this.maxVelocity.y/2;
			}

			// animations
			if (this.velocity.x != 0) {
				play("walk");
			}
			else {
				play("idle");
			} 

			super.update();
		}
	}
}