package  
{
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author JR
	 */
	public class TitleText 
	{
		public static const FONT_SIZE:int = 60;
		public static const SHADOW_COLOR:uint = 0xAA333333;
		public static const COLOR:uint = 0xAA33DDDD;
		public static const WIDTH:int = 250;
		public static var textField:FlxText;

		public static function Initialize() 
		{
			textField = new FlxText(150, 100, WIDTH, "CLIMB a ROPE!");
			textField.size = FONT_SIZE;
			textField.color = COLOR;
			textField.shadow = SHADOW_COLOR;
			textField.alignment = "center";
		}
		
		public static function draw():void
		{
			textField.draw();
		}
		
	}

}