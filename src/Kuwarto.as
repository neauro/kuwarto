package
{
	import org.flixel.*;
	[SWF(width="400", height="284", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
	
	public class Kuwarto extends FlxGame
	{
		public function Kuwarto()
		{
			super(400,284,PlayState,2,20,20);
		}
	}
}