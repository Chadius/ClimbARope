package  
{
	import org.flixel.*;
	
	public class Balcony extends FlxSprite 
	{
		
		[Embed (source = "../assets/balcony.png")] private var balcony_img:Class;

		
		public function Balcony(x:int, y:int) 
		{
			super(x, y);
			this.loadGraphic(balcony_img, false, true);
			if(x < 270)
				this.facing = RIGHT;
			else
				this.facing = LEFT;
		}
	}
}