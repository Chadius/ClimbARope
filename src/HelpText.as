package  
{
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author JR
	 */
	public class HelpText 
	{
		public static const FONT_SIZE:int = 30;
		public static const COLOR:uint = 0xAADDDDDD;
		public static const SHADOW_COLOR:uint = 0xAA333333;
		public static const WIDTH:int = 200;
		public var message:String;
		public var textField:FlxText;

		public function HelpText(theMessage:String, theX:int, theY:int) 
		{
			message = theMessage;
			textField = new FlxText(theX, theY, WIDTH, message);
			textField.size = FONT_SIZE;
			textField.color = COLOR;
			textField.shadow = SHADOW_COLOR;
		}
		
		public function draw():void
		{
			textField.draw();
		}
		
	}

}