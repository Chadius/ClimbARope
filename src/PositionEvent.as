package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author JR
	 */
	public class PositionEvent 
	{
		public var goAltitude:Number;			// What the player position needs to be to fire the event
		
		public function PositionEvent(theGoAltitude:Number, theSprite:FlxSprite)
		{
			goAltitude = theGoAltitude;
			super(theSprite);
		}
	}
}