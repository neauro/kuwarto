package
{
	import org.flixel.*;
	[SWF(width="300", height="200", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
	
	public class Kuwarto extends FlxGame
	{
		public function Kuwarto()
		{
			super(300,200,PlayState,2);
		}
	}
}