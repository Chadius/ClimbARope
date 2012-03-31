package
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{
		// Embed the player's image in the swf
		[Embed (source = "../assets/tracy.png")] private var player_img:Class;

		public function Player(x:int, y:int)
		{
			// Make a FlxSprite at the given location, using our image
			super(x, y);
			this.loadGraphic(player_img, true, true, 64, 64);
			this.addAnimation("Climbing", [1, 0], 2, false);
			this.facing = RIGHT;
		}

		override public function update():void
		{

			if ( FlxG.keys.UP )
			{
				y -= 1;
				this.play("Climbing");
			}
			if ( FlxG.keys.DOWN )
			{
				y += 1;
				this.play("Climbing");	
			}
			if ( FlxG.keys.LEFT && this.facing != RIGHT)
			{
				x -= 32;
				this.facing = RIGHT;
			}
			if ( FlxG.keys.RIGHT && this.facing != LEFT)
			{
				x += 32;
				this.facing = LEFT;
			}
			super.update();
		}


	}
}