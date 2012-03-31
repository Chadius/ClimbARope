package  
{
	import org.flixel.*;
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author JR
	 */
	public class Level
	{
		public var player:Player;				//refers to the trenchcoated player character
/*		public var rope:Rope;					//refers to the dangling rope
		
		public var balconies:BalconyList;		//refers to the balconies obstructing player movement
		public var events:EventList;			//refers to all timed and positionally-cued events: enemy and projectile spawns, etc.
		
		public var projectiles:ProjectileList;	//refers to all player and enemy projectiles
*/		
		public var levelComplete:Boolean;		//true if and only if player reaches the endpoint
		public var endpoint:int;				//the y-value the player needs to reach in order to complete the level
		
		public var testerI:int;	// these are just to make sure the flow works
		public var testTextField:FlxText;
		public var phaseOne:Boolean;
		
		public function Level(i:int) 
		{
			testTextField = new FlxText(0, 0, 100, i.toString());
			
			//construct player, 
			player = new Player(125, 230);
			levelComplete = false;
			endpoint = 10;
			
			//add player, 
			//add(player);
		}
		
		public function update():void
		{
			if (player.y <= endpoint)
			{
				levelComplete = true;
			}
			//this is for testing ONLY
			else if (FlxG.keys.SPACE)
			{
				phaseOne = true;
			}
			else if (phaseOne && FlxG.keys.G)
			{
				levelComplete = true;
			}
			else
			{
				//update everything
				//add(testTextField);
			}
		}
		
		public function draw():void
		{
			testTextField.draw();
		}
	}
}