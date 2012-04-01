package
{
	import org.flixel.*;

	public class TestState extends FlxState
	{
		private var player:Player;
		private var rope:Rope;
		public function TestState()
		{
			super();
		}

		override public function create():void
		{

			rope = new Rope(400, 0, FlxG.height);
			add(rope);
			
			player = new Player(360, 400);
			add(player);
			
			super.create();
		}
	}
}