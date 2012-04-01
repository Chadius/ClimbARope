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
		[Embed (source = "../assets/audio/Pivot-2.mp3")] private var pivotSound:Class;

		public var windowGroup:FlxGroup;
		public var window_img:Class;
		
		public var background:FlxSprite;		//Background image.
		
		public var isVictoryLevel:Boolean;
		public var victoryImage:FlxSprite;
		
		public function Level(i:int, theEvents:EventList, theHelpText:HelpText, theBalconyGroup:FlxGroup, 
							thePlayer:Player, background_img:Class, theWindowsGroup:FlxGroup, thewindow_img:Class,
							ropeHeight:int) 
		{
			helpText = theHelpText;
			events = theEvents;
			testTextField = new FlxText(0, 0, 100, i.toString());
			levelComplete = false;
			victorySoundHasPlayed = false;
			endpoint = 10;
			rope = new Rope(270, 0, ropeHeight);
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
			windowGroup = theWindowsGroup;
			window_img = thewindow_img;
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
					if (player.flipedThisTurn) {
						FlxG.play(pivotSound);
					}
					
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
			helpText.draw();
			group.draw();
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
			//Place a window at each balcony.
			var i:int;
			for (i = 0; i < this.balconyGroup.length; i++)
			{
				if(this.balconyGroup.members[i] != null)
					makeWindowFromBalcony(this.balconyGroup.members[i]);
			}
		}

		public function makeWindowFromBalcony(bal:Balcony):void
		{
			var windowWidth:int = 128;
			var windowHeight:int = 128;
			var balconyWidth:int = 230;
			windowGroup.add(new FlxSprite(bal.x + (balconyWidth - windowWidth) / 2, bal.y - windowHeight + 68, window_img));
		}
	}
}