package
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{
		// Embed the player's image in the swf
		[Embed (source = "../assets/tracyLeft01.png")] private var player_img:Class;

		public function Player(x:int, y:int)
		{
			// Make a FlxSprite at the given location, using our image
			super(x, y);
			loadGraphic(player_img, true, true, 39, 53);
			facing = RIGHT;
		}

		override public function update():void
		{

			if ( FlxG.keys.UP )
			{
				y -= 1;
			}
			if ( FlxG.keys.DOWN )
			{
				y += 1;
			}
			super.update();
		}


	}
}