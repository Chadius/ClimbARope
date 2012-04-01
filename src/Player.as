package
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{
		// Embed the player's image in the swf
		[Embed (source = "../assets/tracy.png")] private var player_img:Class;
		
		public static const CLIMB_SPEED:Number = 3.0;	// a floating-point multiplier for the player's speed
		public static const FALL_SPEED:Number = 6.0;
		public static const SLIP_SPEED:Number = -0.2;
		public static const START_ALTITUDE:int = 700;
		public static const START_X:int = 200;
		public var hasFailed:Boolean = false;
		
		public function Player(x:int, y:int)
		{
			// Make a FlxSprite at the given location, using our image
			super(x, y);
			this.loadGraphic(player_img, true, true, 128, 128);
			this.addAnimation("Climb", [1, 0], 6, false);
			this.addAnimation("Fail", [2, 3], 10, true);
			this.facing = RIGHT;
		}

		override public function update():void
		{
			if (this.hasFailed == false)
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
					this.flip();
				}
				if ( FlxG.keys.RIGHT && this.facing != LEFT)
				{
					this.flip();
				}
				if ( !(FlxG.keys.UP || FlxG.keys.DOWN) && y != 700) {
					y -= SLIP_SPEED;
				}
			}
			else
				y += FALL_SPEED;
			super.update();
		}
		
		public function fail():void
		{
			this.hasFailed = true;
			this.play("Fail");
		}
		
		public function flip():void
		{
			if (this.facing == RIGHT) {
				this.facing = LEFT;
				this.x = 244;
			} else {
				this.facing = RIGHT;
				this.x = 200;
			}
		}
		
		public function collideWithBalcony(balcony:Balcony	):void 
		{
			if (this.overlapsAt(this.x, this.last.y, balcony)) {
				this.flip();
			} else {
				this.y = this.last.y;
			}
		}
	}
}