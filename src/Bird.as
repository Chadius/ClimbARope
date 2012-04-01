package  
{
	import org.flixel.*;

	/**
	 * ...
	 * @author Chad Serrant
	 * 
	 * Birds fly horizontally.
	 */
	public class Bird extends EnemyProjectile
	{
		// Embed the player's image in the swf
		[Embed (source = "../assets/pot.png")] private var bird_img:Class;
		[Embed (source = "../assets/audio/Crow_Death_1.mp3")] private var crowDeath1:Class;
		[Embed (source = "../assets/audio/Crow_Death_1.mp3")] private var crowDeath2:Class;
		[Embed (source = "../assets/audio/Crow_Death_1.mp3")] private var crowDeath3:Class;
		
		// a floating-point multiplier for the bird's flying speed.
		public static const FLY_SPEED:Number = 1.0;
		public var crashed:Boolean = false;
		public var flyToTheRight:Boolean;
		
		public function Bird(x:int, y:int) 
		{
			// Make a FlxSprite at the given location, using our image
			super(x, y);
			this.loadGraphic(bird_img, true, true, 64, 64);
			this.addAnimation("Fly", [0, 1], 6, true);
			this.addAnimation("Crash", [2, 3], 10, false);
			
			//Determine facing
			if (x < 270)
			{
				this.flyToTheRight = true;
				this.facing = RIGHT;
			}
			else
			{
				this.flyToTheRight = false;
				this.facing = LEFT;
			}
		}
		
		override public function update():void
		{
			if (this.crashed == false)
			{
				if(this.flyToTheRight)
					x += FLY_SPEED;
				else
					x -= FLY_SPEED;
				this.play("Fly");
				//dissapear if offscreen
				if (this.onScreen == false)
					this.kill();
			}
			else
			{
				//if the animation has finished, dissapear
				if (this.finished)
					this.kill();
			}
			super.update();
		}
		
		override public function fail():void
		{
			if (this.crashed == true)
				return;
			this.crashed = true;
			this.play("Crash");
		
		switch (Math.floor(FlxG.random() * 3)) {
			case 0:
				FlxG.play(crowDeath1);
				break;
			case 1:
				FlxG.play(crowDeath2);
				break;
			case 2:
				FlxG.play(crowDeath3);
				break;
			default:
				break;
		}
		}
	}
}