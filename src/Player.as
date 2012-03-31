package
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{
		// Embed the player's image in the swf
		[Embed (source = "../assets/tracy.png")] private var player_img:Class;
		
		
		public static const CLIMB_SPEED:Number = 3.0;	// a floating-point multiplier for the player's speed

		public function Player(x:int, y:int)
		{
			// Make a FlxSprite at the given location, using our image
			super(x, y);
			this.loadGraphic(player_img, true, true, 64, 64);
			this.addAnimation("Climb", [1, 0], 7, false);
			this.addAnimation("Fail", [2, 3], 15, true);
			this.facing = RIGHT;
		}

		override public function update():void
		{

			if ( FlxG.keys.UP )
			{
				y -= CLIMB_SPEED;
				this.play("Climb");
			}
			if ( FlxG.keys.DOWN )
			{
				y += CLIMB_SPEED;
				this.play("Climb");
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