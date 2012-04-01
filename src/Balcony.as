package  
{
	import org.flixel.*;
	
	public class Balcony extends FlxSprite 
	{		
		public function Balcony(x:int, y:int, balcony_img:Class) 
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