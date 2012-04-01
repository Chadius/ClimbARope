package  
{
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author JR
	 */
	public class MenuText 
	{
		public static const FONT_SIZE:int = 30;
		public static const SHADOW_COLOR:uint = 0xAA333333;
		public static const WIDTH:int = 400;
		public var message:String;
		public var textField:FlxText;

		public function MenuText(theMessage:String, theX:int, theY:int, color:uint) 
		{
			message = theMessage;
			textField = new FlxText(theX, theY, WIDTH, message);
			textField.size = FONT_SIZE;
			textField.color = color;
			textField.shadow = SHADOW_COLOR;
			textField.alignment = "center";
		}
		
		public function draw():void
		{
			textField.draw();
		}
		
	}

}