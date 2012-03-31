package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author JR
	 */
	public class TimedEvent extends LevelEvent
	{
		public var goTime:Number;				// When to fire the event
		
		public function TimedEvent(theGoTime:Number, theSprite:FlxSprite)
		{
			goTime = theGoTime;
			super(theSprite);
		}
	}
}