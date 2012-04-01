package  
{
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author JR
	 */
	public class HelpText 
	{
		public var message:String;
		public var textField:FlxText;

		public function HelpText(theMessage:String, theX:int, theY:int, theWidth:int) 
		{
			message = theMessage;
			textField = new FlxText(theX, theY, theWidth, message);
		}
		
		public function draw():void
		{
			textField.draw();
		}
		
	}

}