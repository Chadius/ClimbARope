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
		
		public function EventList(timed:Vector.<FlxSprite>, position:Vector.<FlxSprite>)
		{
			timedEvents = timed;
			positionEvents = position;
		}
		
		public function getNextSprite(elapsed:Number, playerAltitude:int):FlxSprite
		{
			var nextEvent:LevelEvent = null;
			var nextSprite:FlxSprite = null;
			
			if ((timedEvents[0] != null) &&
				(timedEvents[0].goTime <= elapsed))
			{
				nextEvent = timedEvents.shift();
				nextSprite = nextEvent.sprite;
				return nextSprite;
			}
			if ((positionEvents[0] != null) &&
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