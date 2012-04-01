package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author JR
	 */
	public class World extends PlayState 
	{
		public var levels:Vector.<Level>;				//refers to all the levels within the world
		public var currentLevel:Level;					//refers to the currently active level
		public var player:Player;
		
		[Embed (source = "../assets/audio/ClimbARopethemelooped.mp3")] private var theme:Class;
		
		public static const ROPE_RIGHT:int = 300;
		public static const ROPE_LEFT:int = 220;
		public static const FAR_RIGHT:int = 450;
		public static const FAR_LEFT:int = 70;
		
		public static const FROM_ABOVE:int = -50;
		public static const FROM_LEFT:int = -20;
		public static const FROM_RIGHT:int = 560;
		
		public static const TEXT_LEFT:int = 40;
		public static const TEXT_RIGHT:int = 350;
		public static const TEXT_LOW:int = 550;
		public static const TEXT_MID:int = 300;
		public static const TEXT_HIGH:int = 100;
		
		public static const BALC_LEFT:int = 20;
		public static const BALC_RIGHT:int = 320;
		public static const BALC_Y5:int = 600;
		public static const BALC_Y4:int = 475;
		public static const BALC_Y3:int = 350;
		public static const BALC_Y2:int = 225;
		public static const BALC_Y1:int = 100;
		
		public static const WINDOW_LEFT:int = 75;
		public static const WINDOW_RIGHT:int = 375;
		public static const WINDOW_Y5:int = 540;
		public static const WINDOW_Y4:int = 415;
		public static const WINDOW_Y3:int = 290;
		public static const WINDOW_Y2:int = 165;
		public static const WINDOW_Y1:int = 40;
		
		public function WorldState():void
		{
			
		}
		
		override public function create():void
		{
			currentLevel = levels.shift();				//pulls the first level off the queue
			
			FlxG.playMusic(theme, 0.2);
		}
		
		override public function update():void
		{
			if (currentLevel.levelComplete)
			{
				player.y = Player.START_ALTITUDE;
				nextLevel();
			}
			else
			{
				currentLevel.update();
			}
			
			//draw();
		}
		
		override public function draw():void
		{
			currentLevel.draw();
		}
		
		private function nextLevel():void
		{
			if (levels.length > 0)
			{
				currentLevel = levels.shift();
				
			}
			else
			{
				worldComplete();
			}
		}
		
		private function worldComplete():void
		{
			FlxG.switchState(new PlayState);
		}
	}

}