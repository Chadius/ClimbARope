package  
{
	import org.flixel.*;
	
	public class Balcony extends FlxSprite 
	{
		
		[Embed (source = "../assets/balcony.png")] private var balcony_img:Class;

		
		public function Balcony(x:int, y:int) 
		{
			super(x, y, balcony_img);
			
		}
	}

}