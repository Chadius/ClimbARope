package
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{
		// Embed the player's image in the swf
		[Embed (source = "../assets/tracy.png")] private var player_img:Class;
		
		public static const CLIMB_SPEED:Number = 3.0;	// a floating-point multiplier for the player's speed
		public var hasFailed:Boolean = false;
		
		public function Player(x:int, y:int)
		{
			// Make a FlxSprite at the given location, using our image
			super(x, y);
			this.loadGraphic(player_img, true, true, 128, 128);
			this.addAnimation("Climb", [1, 0], 6, false);
			this.addAnimation("Fail", [2, 3], 15, true);
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
					this.facing = RIGHT;
				}
				if ( FlxG.keys.RIGHT && this.facing != LEFT)
				{
					this.facing = LEFT;
				}
			}
			super.update();
		}
		
		public function fail():void
		{
			this.hasFailed = true;
			this.play("Fail");
		}
		
		public function getRopeOffset():Number 
		{
			return (this.facing == RIGHT)? -70 : -26;
		}
		
		public function getPlayerOffset():Number 
		{
			return this.width * ((this.facing == RIGHT)? -1: 1);
		}
		
		public function collideWithBalcony(balcony:Balcony):void 
		{
			if (this.overlapsAt(this.x, this.last.y, balcony)) {
				trace("this.facing ", this.facing);
				this.facing = (this.facing == LEFT)? RIGHT: LEFT;
				this.x = this.x + this.getPlayerOffset();
				trace("this.facing ", this.facing);
			} else {
				this.y = this.last.y;
			}
		}
	}
}