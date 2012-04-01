package
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{
		// Embed the player's image in the swf
		[Embed (source = "../assets/tracy.png")] private var player_img:Class;
		[Embed (source = "../assets/audio/PlayerDeath.mp3")] private var deathSound:Class;

		public static const CLIMB_SPEED:Number = 3.0;	// a floating-point multiplier for the player's speed
		public static const FALL_SPEED:Number = 6.0;
		public static const SLIP_SPEED:Number = -0.5;	// the player's natural slip rate due to slippery rope
		public static const SLIDE_SPEED:Number = 7.0;	// the player's speed when deliberately sliding down
		public static const START_ALTITUDE:int = 700;
		public static const START_X:int = 200;
		public static const LEFT_POSITION:int = 200;
		public static const RIGHT_POSITION:int = 244;
		public var hasFailed:Boolean = false;
		public var flipedThisTurn:Boolean = false;
		
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
			flipedThisTurn = false;
			if (this.hasFailed == false)
			{
				if ( FlxG.keys.UP )
				{
					y -= CLIMB_SPEED;
					this.play("Climb");
				}
				if ( FlxG.keys.DOWN )
				{
					y += SLIDE_SPEED;
				}
				if ( FlxG.keys.LEFT && this.facing != RIGHT)
				{
					this.flip();
				}
				if ( FlxG.keys.RIGHT && this.facing != LEFT)
				{
					this.flip();
				}
				if ( !(FlxG.keys.UP || FlxG.keys.DOWN)) {
					y -= SLIP_SPEED;
				}
			}
			else
				y += FALL_SPEED;
			if (y >= 700 && !hasFailed)
			{
				y = 700;
			}
			super.update();
			
		}
		
		public function fail():void
		{
			if (!this.hasFailed) {
				this.hasFailed = true;
				this.play("Fail");
				FlxG.play(deathSound);
				FlxG.music.fadeOut(0.5);
			}
			
		}
		
		public function flip():void
		{
			flipedThisTurn = true;
			if (this.facing == RIGHT) {
				this.facing = LEFT;
				this.x = RIGHT_POSITION;
			} else {
				this.facing = RIGHT;
				this.x = LEFT_POSITION;
			}
		}
		
		public function collideWithBalcony(balcony:Balcony	):void 
		{
			if (flipedThisTurn) {
				this.flip();
				flipedThisTurn = false;
			} else {
				this.y = this.last.y
			}
			
		}
	}
}