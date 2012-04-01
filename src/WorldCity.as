package  
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author JR
	 */
	public class WorldCity extends World 
	{
		public static const LEVEL_COUNT:int = 13;
		
		public function WorldCity() 
		{
			player = new Player(Player.START_X, Player.START_ALTITUDE);

			//Define each level in the world
			var i:int;
			levels = new Vector.<Level>;
			for (i = 0; i < LEVEL_COUNT; i++) 
			{
				levels.push(new Level(i, eventsForLevel(i), helpTextForLevel(i), balconiesForLevel(i), player));
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
					/*timedEvents.push(new TimedEvent(1, new Pot(ROPE_LEFT, FROM_ABOVE)));
					timedEvents.push(new TimedEvent(1, new Pot(ROPE_RIGHT, FROM_ABOVE)));
					positionEvents.push(new PositionEvent(200, new Pot(ROPE_RIGHT, 20)));*/
					break;
				case 2:
					break;
				case 3:
					break;
				case 4:
					positionEvents.push(new PositionEvent(500, new Pot(FAR_RIGHT, FROM_ABOVE)));
					break;
				case 5:
					positionEvents.push(new PositionEvent(500, new Pot(ROPE_LEFT, FROM_ABOVE)));
					break;
				case 6:
					timedEvents.push(new TimedEvent(1, new Pot(ROPE_LEFT, FROM_ABOVE)));
					timedEvents.push(new TimedEvent(2, new Pot(ROPE_RIGHT, FROM_ABOVE)));
					break;
				case 7:
					timedEvents.push(new TimedEvent(0.5, new Pot(ROPE_LEFT, FROM_ABOVE)));
					timedEvents.push(new TimedEvent(1.5, new Pot(ROPE_RIGHT, FROM_ABOVE)));
					timedEvents.push(new TimedEvent(2.5, new Pot(ROPE_LEFT, FROM_ABOVE)));
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
					helpText = new HelpText("Press UP to climb!", TEXT_LEFT, TEXT_LOW, 50);
					break;
				case 1:
					helpText = new HelpText("Press RIGHT to pivot right!", TEXT_RIGHT, TEXT_MID, 50);
					break;
				case 2:
					helpText = new HelpText("Press LEFT to pivot left!", TEXT_LEFT, TEXT_MID, 50);
					break;
				case 6:
					helpText = new HelpText("Oh right. Watch out for pots.", TEXT_LEFT, TEXT_MID, 50);
					break;
				case 6:
					helpText = new HelpText("Those birds are dangerous!", TEXT_LEFT, TEXT_HIGH, 50);
					break;
				default:
					helpText = new HelpText("", TEXT_LEFT, TEXT_MID, 50);
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
					balconies.add(new Balcony(BALC_LEFT, BALC_Y3));
					break;
				case 2:
					balconies.add(new Balcony(BALC_RIGHT, BALC_Y3));
					break;
				case 3:
					balconies.add(new Balcony(BALC_LEFT, BALC_Y4));
					balconies.add(new Balcony(BALC_RIGHT, BALC_Y2));
					break;
				case 4:
					balconies.add(new Balcony(BALC_RIGHT, BALC_Y4));
					balconies.add(new Balcony(BALC_LEFT, BALC_Y2));
					break;
				case 5:
					balconies.add(new Balcony(BALC_RIGHT, BALC_Y3));
					break;
				case 6:
					
					break;
				case 7:
					
					break;
				case 8:
					balconies.add(new Balcony(BALC_RIGHT, BALC_Y3));
					break;
				case 9:
					balconies.add(new Balcony(BALC_LEFT, BALC_Y3));
					break;
				case 10:
					
					break;
				case 11:
					
					break;
				case 12:
					balconies.add(new Balcony(BALC_LEFT, BALC_Y5));
					break;
				default:
					
					break;
			}

			return balconies;
		}
	}
}