package  
{
	import org.flixel.*;

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
		[Embed (source = "../assets/backgroundBrix.png")] private var background_brix_img:Class;
		[Embed(source="../assets/backgroundBrixTop.png")] private var background_brix_top:Class;
		
		[Embed (source = "../assets/balcony.png")] private var balcony_img:Class;
		[Embed (source = "../assets/balcony2.png")] private var balcony2_img:Class;
		
		[Embed (source = "../assets/pot.png")] private var pot_img:Class;
		[Embed (source = "../assets/pot2.png")] private var pot2_img:Class;
		
		[Embed (source = "../assets/window.png")] private var window_img:Class;
		
		public function WorldCity() 
		{
			player = new Player(Player.START_X, Player.START_ALTITUDE);

			//Define each level in the world

			var i:int;
			levels = new Vector.<Level>;
			for (i = 0; i < LEVEL_COUNT; i++) 
			{
				levels.push(new Level(i, eventsForLevel(i), helpTextForLevel(i), balconiesForLevel(i), player, 
									getBackGroundImg(i), windowsForLevel(i), window_img, getRopeHeight(i)));
			}
			//Add the victory level and image here.
			var victory_level:int = LEVEL_COUNT - 1;
			levels[victory_level].isVictoryLevel = true;
			levels[victory_level].victoryImage = new FlxSprite(0, 0, victory_img);
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
					positionEvents.push(new PositionEvent(500, new Pot(FAR_RIGHT, FROM_ABOVE, pot2_img)));
					break;
				case 5:
					positionEvents.push(new PositionEvent(500, new Pot(ROPE_LEFT, FROM_ABOVE, pot2_img)));
					break;
				case 6:
					timedEvents.push(new TimedEvent(1, new Pot(ROPE_LEFT, FROM_ABOVE, pot2_img)));
					timedEvents.push(new TimedEvent(2, new Pot(ROPE_RIGHT, FROM_ABOVE, pot2_img)));
					break;
				case 7:
					timedEvents.push(new TimedEvent(0, new Pot(ROPE_LEFT, FROM_ABOVE, pot2_img)));
					timedEvents.push(new TimedEvent(1, new Pot(ROPE_RIGHT, FROM_ABOVE, pot2_img)));
					timedEvents.push(new TimedEvent(2, new Pot(ROPE_LEFT, FROM_ABOVE, pot2_img)));
					break;
				case 8:
					positionEvents.push(new PositionEvent(500, new Pot(ROPE_LEFT, FROM_ABOVE, pot2_img)));
					positionEvents.push(new PositionEvent(300, new Pot(ROPE_LEFT, FROM_ABOVE, pot2_img)));
					break;
				case 9:
					positionEvents.push(new PositionEvent(500, new Pot(ROPE_RIGHT, FROM_ABOVE, pot2_img)));
					positionEvents.push(new PositionEvent(300, new Pot(ROPE_RIGHT, FROM_ABOVE, pot2_img)));
					positionEvents.push(new PositionEvent(200, new Pot(ROPE_LEFT, FROM_ABOVE, pot2_img)));
					break;
				case 10:
					timedEvents.push(new TimedEvent(0.5, new Pot(ROPE_RIGHT, FROM_ABOVE, pot2_img)));
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
					balconies.add(new Balcony(BALC_LEFT, BALC_Y3, balcony2_img));
					//temp
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
		
		private function windowsForLevel(i:int):FlxGroup
		{
			var windows:FlxGroup = new FlxGroup();
			
			switch (i)
			{
				case 0:
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y1, window_img));
					//windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y3, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y3, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y5, window_img));
					break;
				case 1:
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y5, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y5, window_img));
					break;
				case 2:
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y5, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y5, window_img));
					break;
				case 3:
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y2, window_img));;
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y4, window_img));
					break;
				case 4:
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y4, window_img));;
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y2, window_img));
					break;
				case 5:
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y3, window_img));
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y5, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y5, window_img));
					break;
				case 6:
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y5, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y3, window_img));
					break;
				case 7:
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y3, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y5, window_img));
					break;
				case 8:
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y3, window_img));
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y5, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y5, window_img));
					break;
				case 9:
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y5, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y3, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y5, window_img));
					break;
				case 10:
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y2, window_img));
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y4, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y2, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y4, window_img));
					break;
				case 11:
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y3, window_img));
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y5, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y3, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y5, window_img));
					break;
				case 12:
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y1, window_img));
					windows.add(new FlxSprite(WINDOW_LEFT, WINDOW_Y3, window_img));
					windows.add(new FlxSprite(WINDOW_RIGHT, WINDOW_Y5, window_img));
					break;
				default:
					break;
			}
			return windows;
		}
		
		private function getBackGroundImg(i:int):Class 
		{
			if (i == 12) {
				return background_brix_top;
			}
			return background_brix_img;
		}
		
		private function getRopeHeight(i:int):int 
		{
			if (i == 12) {
				return FlxG.height - 75;
			}
			return FlxG.height;
		}
	}
}