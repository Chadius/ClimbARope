package  
{
	/**
	 * ...
	 * @author JR
	 */
	public class WorldCity extends World 
	{
		
		public function WorldCity() 
		{
			
			
			//Define each level
			//testing only!
			var i:int;
			levels = new Vector.<Level>;
			for (i = 0; i < 10; i++) 
			{
				levels.push(new Level(i, eventsForLevel(i)));
			}
		}
		
		private function eventsForLevel(i:int):EventList
		{
			var timedEvents:Vector.<TimedEvent> = new Vector.<TimedEvent>;
			var positionEvents:Vector.<PositionEvent> = new Vector.<PositionEvent>;
			
			switch (i)
			{
				case 0:
					timedEvents.push(new TimedEvent(5, new Pot(20, 20)));
					positionEvents.push(new PositionEvent(200, new Pot(300, 20)));
				default:
					timedEvents.push(new TimedEvent(10, new Pot(400, 20)));
					positionEvents.push(new PositionEvent(200, new Pot(400, 20)));
			}
			
			return new EventList(timedEvents, positionEvents);
		}
		
	}

}