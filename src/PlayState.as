package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		public var player:Player;
		
		public function PlayState()
		{
		}

		override public function create():void
		{
			player = new Player(125, 230);
			add(player);
		}
	}
}