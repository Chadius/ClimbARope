package
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import org.flixel.*;

	public class Rope extends FlxSprite
	{
		// Embed the player's image in the swf
		[Embed (source = "../assets/rope.png")] private var rope_img:Class;

		public function Rope(x:int, y:int, ropeHeight:int)
		{			
			// Make a FlxSprite at the given location, using our image
			height = ropeHeight;
			super(x, FlxG.height - ropeHeight, rope_img);
			
			var new_pixels:BitmapData = new BitmapData(pixels.width, ropeHeight);
			for (var i:int; new_pixels.height > (pixels.height * i); i++) {
				new_pixels.copyPixels(pixels, pixels.rect, new Point(0, pixels.height * i));
			}
			pixels = new_pixels;
		}

		override public function update():void
		{
			super.update();
		}

	}
}