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
		public var victorySoundHasPlayed:Boolean;//true once the victory sound has played
		public var endpoint:int;				//the y-value the player needs to reach in order to complete the level
		
		public var testTextField:FlxText;
		public var helpText:HelpText;			//help text for the player, if needed
		
		public var group:FlxGroup;
		
		public var timeInLevel:Number;			//the total time spent in the level so far
		
		public var resetTimerCountdown:Boolean; //If this is on, start to count down
		public var resetTimerWait:Number = 5.0; //Wait this long before resetting the game
		public var resetTimerElapsed:Number;			//the total time spent waiting for a reset
			
		[Embed (source = "../assets/audio/Victory_1.mp3")] private var victorySound:Class;
		[Embed (source = "../assets/window.png")] private var window_img:Class;
		public var windowGroup:FlxGroup;
		
		public var background:FlxSprite;		//Background image.
		
		public var isVictoryLevel:Boolean;
		public var victoryImage:FlxSprite;
		
		public function Level(i:int, theEvents:EventList, theHelpText:HelpText, theBalconyGroup:FlxGroup, 
							thePlayer:Player, background_img:Class) 
		{
			helpText = theHelpText;
			events = theEvents;
			testTextField = new FlxText(0, 0, 100, i.toString());
			levelComplete = false;
			victorySoundHasPlayed = false;
			endpoint = 10;
			rope = new Rope(270, 0);
			player = thePlayer;
			//player.y = Player.START_ALTITUDE;
			balconyGroup = theBalconyGroup;
			group = new FlxGroup();
			group.add(rope);
			group.add(player);
			EnemyProjectiles = new FlxGroup();
			//Load the background
			background = new FlxSprite(0, 0, background_img);
			timeInLevel = 0;
			resetTimerCountdown = false;
			resetTimerElapsed = 0;
			//And the windows
			makeWindows();
		}
		
		public function update():void
		{
			timeInLevel += FlxG.elapsed;
			if (isVictoryLevel == false)
			{
				if (player.y <= endpoint)// || FlxG.keys.SPACE) // level skip cheat (Spacebar)
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
					FlxG.overlap(EnemyProjectiles, balconyGroup, collide_projectile_balcony);
					
				}
			}
			
			//Reset the level after waiting long enough.
			if (resetTimerCountdown == true || isVictoryLevel == true)
			{
				if (isVictoryLevel && !victorySoundHasPlayed) {
					FlxG.play(victorySound);
					victorySoundHasPlayed = true;
				}
				resetTimerElapsed += FlxG.elapsed;
				if (resetTimerElapsed > resetTimerWait)
					FlxG.switchState(new MenuState);
			}
		}
		
		public function draw():void
		{
			if (isVictoryLevel)
			{
				victoryImage.draw();
				return;
			}
			background.draw();
			windowGroup.draw();
			testTextField.draw();
			group.draw();
			helpText.draw();
			balconyGroup.draw();
			EnemyProjectiles.draw();
		}
		
		private function collidePlayerProjectile(p:Player, proj:EnemyProjectile):void
		{
			//Now do a pixel-perfect version of collision
			
			if (FlxCollision.pixelPerfectCheck(p, proj))
			{
				proj.fail();
				p.fail();
				//Start the reset countdown.
				if (resetTimerCountdown == false)
					resetTimerCountdown = true;
			}
		}
		
		public function collide_player_balcony(player:Player, balcony:Balcony):void 
		{
			if (FlxCollision.pixelPerfectCheck(player, balcony) && !player.hasFailed){
				player.collideWithBalcony(balcony);
			}
		}
		
		public function collide_projectile_balcony(proj:EnemyProjectile, balcony:Balcony):void 
		{
			if (FlxCollision.pixelPerfectCheck(proj, balcony) && !(proj is Bird))
				proj.fail();
		}

		public function makeWindows():void
		{
			windowGroup = new FlxGroup();
			makeWindowsHelper(20);
			makeWindowsHelper(400);
		}

		public function makeWindowsHelper(windowX:int):void
		{
			var windowY:int;
			var windowWidth:int;
			var windowHeight:int;
			
			windowY = -128;
			windowWidth = 128;
			windowHeight = 128;
			
			do
			{
				windowX += (FlxG.random() * windowWidth / 4.0) - (windowWidth / 8.0);
				windowY += windowHeight + (FlxG.random() * windowHeight / 4.0) + windowHeight / 4.0;
				
				windowGroup.add(new FlxSprite(windowX, windowY, window_img));
			} while (windowY < 800)
		}
	}
}