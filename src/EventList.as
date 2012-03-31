package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author JR
	 */
	public class EventList 
	{
		public var timedEvents:Vector.<TimedEvent>;				//events that trigger at a particular time in the level
		public var positionEvents:Vector.<PositionEvent>;		//events that trigger when the player reaches a particular altitude
		
		public function EventList(timed:Vector.<TimedEvent>, position:Vector.<PositionEvent>)
		{
			timedEvents = timed;
			positionEvents = position;
		}
		
		public function getNextSprite(elapsed:Number, playerAltitude:int):FlxSprite
		{
			var nextEvent:LevelEvent = null;
			var nextSprite:FlxSprite = null;
			
			if ((timedEvents.length != 0) &&
				(timedEvents[0].goTime <= elapsed))
			{
				nextEvent = timedEvents.shift();
				nextSprite = nextEvent.sprite;
				return nextSprite;
			}
			if ((positionEvents.length != 0) &&
				(positionEvents[0].goAltitude >= playerAltitude))
			{
				nextEvent = positionEvents.shift();
				nextSprite = nextEvent.sprite;
				return nextSprite;
			}
			
			return null;
		}
	}
}