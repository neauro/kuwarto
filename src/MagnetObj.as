package
{
	import org.flixel.*;
	
	public class MagnetObj extends FlxSprite
	{
		public function MagnetObj(x:Number, y:Number)
		{
			this.x = x;
			this.y = y;
			this.drag.x = this.maxVelocity.x*4;

			makeGraphic(10,10,0xFFFF0000);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}
