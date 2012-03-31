package  
{
	import org.flixel.*;
	import org.flixel.FlxPoint;
	import org.flixel.plugin.*;
	import org.flixel.plugin.photonstorm.*;	

	/**
	 * ...
	 * @author JR
	 * @author Chad Serrant
	 */
	public class Level
	{
		public var player:Player;				//refers to the trenchcoated player character
		public var rope:Rope;					//refers to the dangling rope
		
		public var balconyGroup:FlxGroup;		//refers to the balconies obstructing player movement
		public var events:EventList;			//refers to all timed and positionally-cued events: enemy and projectile spawns, etc.
		public var EnemyProjectiles:FlxGroup;	//refers to all player and enemy projectiles
		public var levelComplete:Boolean;		//true if and only if player reaches the endpoint
		public var endpoint:int;				//the y-value the player needs to reach in order to complete the level
		
		public var testTextField:FlxText;
		
		public var group:FlxGroup;
		
		public var timeInLevel:Number;			//the total time spent in the level so far
		
		[Embed (source = "../assets/backgroundDay.png")] private var background_day_img:Class;
		public var background:FlxSprite;		//Background image.
		
		public function Level(i:int, theEvents:EventList) 
		{
			events = theEvents;
			testTextField = new FlxText(0, 0, 100, i.toString());
			levelComplete = false;
			endpoint = 10;
			rope = new Rope(270, 0);
			player = new Player(240, 700);
			balconyGroup = new FlxGroup();
			balconyGroup.add(new Balcony(0, 200));
			group = new FlxGroup();
			group.add(rope);
			group.add(player);
			EnemyProjectiles = new FlxGroup();
			EnemyProjectiles.add(new Pot(200, 0));
			//EnemyProjectiles.add(new Bird(0, 400));
			//Load the background
			background = new FlxSprite(0, 0, background_day_img);
			timeInLevel = 0;
		}
		
		public function update():void
		{
			timeInLevel += FlxG.elapsed;
			if (player.y <= endpoint)
			{
				levelComplete = true;
			}
			else
			{
				testTextField.update();
				group.update();
				balconyGroup.update();
				//update everything
				
				//check event list for projectiles, add any relevant ones to the projectile list
				var nextEvent:FlxSprite = null;
				do
				{
					nextEvent = events.getNextSprite(timeInLevel, player.y);
					if (nextEvent != null)
					{
						EnemyProjectiles.add(nextEvent);
					}
				} while (nextEvent != null);
				
				//update projectiles
				EnemyProjectiles.update();
				//did they collide with player?
				FlxG.overlap(player, EnemyProjectiles, collidePlayerProjectile);
				FlxG.overlap(player, balconyGroup, collide_player_balcony);
				player.x = rope.x + player.getRopeOffset();
			}
		}
		
		public function draw():void
		{
			background.draw();
			testTextField.draw();
			group.draw();
			EnemyProjectiles.draw();
			balconyGroup.draw();
		}
		
		private function collidePlayerProjectile(p:Player, proj:EnemyProjectile):void
		{
			//Now do a pixel-perfect version of collision
			
			if (FlxCollision.pixelPerfectCheck(p, proj))
			{
				proj.fail();
				p.fail();
			}
		}
		
		public function collide_player_balcony(player:Player, balcony:Balcony):void 
		{
			player.collideWithBalcony(balcony);
		}
	}
}