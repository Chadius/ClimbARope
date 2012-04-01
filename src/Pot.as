package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Chad Serrant
	 * 
	 * Pots fall straight down.
	 */
	public class Pot extends EnemyProjectile
	{
		// Embed the player's image in the swf
		[Embed (source = "../assets/pot.png")] private var pot_img:Class;
		[Embed (source = "../assets/audio/pot_smash.mp3")] private var potSmash:Class;
		[Embed (source = "../assets/audio/Whoosh.mp3")] private var whoosh:Class;
		
		// a floating-point multiplier for the pot's falling speed.
		public static const FALL_SPEED:Number = 5.0;
		public var broken:Boolean = false;
		public var hasWhooshed:Boolean = false;
		
		public function Pot(x:int, y:int) 
		{
			// Make a FlxSprite at the given location, using our image
			super(x, y);
			this.loadGraphic(pot_img, true, false, 64, 64);
			this.addAnimation("Fall", [0], 1, false);
			this.addAnimation("Break", [1, 2, 3], 10, false);
		}
		
		override public function update():void
		{
			if (this.broken == false)
			{
				y += FALL_SPEED;
				this.play("Fall");
				//dissapear if offscreen
				if (y > 0 && this.onScreen == false)
					this.kill();
			}
			else
			{
				//if the animation has finished, dissapear
				if (this.finished)
					this.kill();
			}
			if (!hasWhooshed) {
				hasWhooshed = true;
				FlxG.play(whoosh);
			}
			super.update();
		}
		
		override public function fail():void
		{
			if (this.broken == true)
				return;
			this.broken = true;
			this.play("Break");
			FlxG.play(potSmash);
		}
	}
}