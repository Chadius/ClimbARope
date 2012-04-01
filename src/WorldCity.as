package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author JR
	 */
	public class WorldCity extends World 
	{
		public static const LEVEL_COUNT:int = 14;
		
		[Embed (source = "../assets/victory.png")] private var victory_img:Class;

		[Embed (source = "../assets/backgroundDay.png")] private var background_day_img:Class;
		[Embed (source = "../assets/backgroundNightScraper.png")] private var background_night_scraper_img:Class;

		[Embed (source = "../assets/balcony.png")] private var balcony_img:Class;
		[Embed (source = "../assets/balcony2.png")] private var balcony2_img:Class;

		public function WorldCity() 
		{
			player = new Player(Player.START_X, Player.START_ALTITUDE);

			//Define each level in the world

			var i:int;
			levels = new Vector.<Level>;
			for (i = 0; i < LEVEL_COUNT; i++) 
			{
				levels.push(new Level(i, eventsForLevel(i), helpTextForLevel(i), balconiesForLevel(i), player, 
									background_night_scraper_img));
			}
			//Add the victory level and image here.
			levels[LEVEL_COUNT - 1].isVictoryLevel = true;
			levels[LEVEL_COUNT - 1].victoryImage = new FlxSprite(0, 0, victory_img);
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
					positionEvents.push(new PositionEvent(500, new Pot(ROPE_LEFT, FROM_ABOVE)));
					positionEvents.push(new PositionEvent(300, new Pot(ROPE_LEFT, FROM_ABOVE)));
					break;
				case 9:
					positionEvents.push(new PositionEvent(500, new Pot(ROPE_RIGHT, FROM_ABOVE)));
					positionEvents.push(new PositionEvent(300, new Pot(ROPE_RIGHT, FROM_ABOVE)));
					positionEvents.push(new PositionEvent(200, new Pot(ROPE_LEFT, FROM_ABOVE)));
					break;
				case 10:
					timedEvents.push(new TimedEvent(0.5, new Pot(ROPE_RIGHT, FROM_ABOVE)));
					positionEvents.push(new PositionEvent(500, new Bird(FROM_LEFT, 400)));
					break;
				case 11:
					positionEvents.push(new PositionEvent(700, new Bird(FROM_RIGHT, 600)));
					positionEvents.push(new PositionEvent(500, new Bird(FROM_LEFT, 400)));
					positionEvents.push(new PositionEvent(300, new Bird(FROM_RIGHT, 200)));
					break;
				case 12:
					positionEvents.push(new PositionEvent(550, new Bird(FROM_LEFT, 550)));
					positionEvents.push(new PositionEvent(425, new Bird(FROM_LEFT, 425)));
					positionEvents.push(new PositionEvent(300, new Bird(FROM_LEFT, 300)));
					positionEvents.push(new PositionEvent(175, new Bird(FROM_LEFT, 175)));
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
					helpText = new HelpText("Press UP to climb!", TEXT_LEFT, TEXT_LOW);
					break;
				case 1:
					helpText = new HelpText("Press RIGHT to pivot right!", TEXT_RIGHT, TEXT_MID);
					break;
				case 2:
					helpText = new HelpText("Press LEFT to pivot left!", TEXT_LEFT, TEXT_MID);
					break;
				case 6:
					helpText = new HelpText("Oh right. Watch out for pots.", TEXT_LEFT, TEXT_MID);
					break;
				case 6:
					helpText = new HelpText("Those birds are dangerous!", TEXT_LEFT, TEXT_HIGH);
					break;
				default:
					helpText = new HelpText("", TEXT_LEFT, TEXT_MID);
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
					balconies.add(new Balcony(BALC_LEFT, BALC_Y3, balcony2_img));
					break;
				case 2:
					balconies.add(new Balcony(BALC_RIGHT, BALC_Y3, balcony2_img));
					break;
				case 3:
					balconies.add(new Balcony(BALC_LEFT, BALC_Y4, balcony2_img));
					balconies.add(new Balcony(BALC_RIGHT, BALC_Y2, balcony2_img));
					break;
				case 4:
					balconies.add(new Balcony(BALC_RIGHT, BALC_Y4, balcony2_img));
					balconies.add(new Balcony(BALC_LEFT, BALC_Y2, balcony2_img));
					break;
				case 5:
					balconies.add(new Balcony(BALC_RIGHT, BALC_Y3, balcony2_img));
					break;
				case 6:
					
					break;
				case 7:
					
					break;
				case 8:
					balconies.add(new Balcony(BALC_RIGHT, BALC_Y3, balcony2_img));
					break;
				case 9:
					balconies.add(new Balcony(BALC_LEFT, BALC_Y3, balcony2_img));
					break;
				case 10:
					
					break;
				case 11:
					
					break;
				case 12:
					balconies.add(new Balcony(BALC_LEFT, BALC_Y5, balcony2_img));
					break;
				default:
					
					break;
			}
			return balconies;
		}
	}
}