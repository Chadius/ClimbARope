package  
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author JR
	 */
	public class WorldCity extends World 
	{
		public static const ROPE_RIGHT:int = 300;
		public static const ROPE_LEFT:int = 220;
		public static const FROM_ABOVE:int = -20;
		public static const FROM_LEFT:int = -20;
		public static const FROM_RIGHT:int = 500;
		
		public function WorldCity() 
		{
			
			
			//Define each level
			//testing only!
			var i:int;
			levels = new Vector.<Level>;
			for (i = 0; i < 10; i++) 
			{
				levels.push(new Level(i, eventsForLevel(i), helpTextForLevel(i), balconiesForLevel(i)));
			}
		}
		
		private function eventsForLevel(i:int):EventList
		{
			var timedEvents:Vector.<TimedEvent> = new Vector.<TimedEvent>;
			var positionEvents:Vector.<PositionEvent> = new Vector.<PositionEvent>;
			
			switch (i)
			{
				case 0:
					break;
				case 1:
					timedEvents.push(new TimedEvent(1, new Pot(ROPE_LEFT, FROM_ABOVE)));
					timedEvents.push(new TimedEvent(1, new Pot(ROPE_RIGHT, FROM_ABOVE)));
					positionEvents.push(new PositionEvent(200, new Pot(ROPE_RIGHT, 20)));
					break;
				case 2:
					break;
				case 3:
					break;
				case 4:
					break;
				case 5:
					break;
				case 6:
					break;
				case 7:
					break;
				case 8:
					break;
				case 9:
					break;
				default:
					break;
			}
			
			return new EventList(timedEvents, positionEvents);
		}
		
		private function helpTextForLevel(i:int):HelpText
		{
			var helpText:HelpText;
			
			switch (i)
			{
				case 0:
					helpText = new HelpText("Press UP to climb!", 30, 600, 50);
					break;
				case 1:
					helpText = new HelpText("Help yourself!", 30, 600, 50);
					break;
				default:
					helpText = new HelpText("", -300, 600, 50);
					break;
			}
			
			return helpText;
		}
		
		private function balconiesForLevel(i:int):FlxGroup
		{
			var balconies:FlxGroup = new FlxGroup();
			
			switch (i)
			{
				case 0:
					
					break;
				case 1:
					balconies.add(new Balcony(0, 200));
					break;
				default:
					
					break;
			}

			return balconies;
		}
	}
}