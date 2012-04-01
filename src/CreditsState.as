package
{
	import org.flixel.*;	

	public class CreditsState extends FlxState
	{
		[Embed (source = "../assets/credits.png")] private var credit_img:Class;
		public var background:FlxSprite;
		private var backToMenuInstructions:MenuText;
		
		public function CreditsState()
		{
			background = new FlxSprite(0, 0, credit_img);
		}
		
		override public function create():void
		{
			FlxG.mouse.show();
			backToMenuInstructions = new MenuText("Press ESC to return to menu.", 90, 600, 0xAADD3333);
			add(backToMenuInstructions.textField);
		}
		
		override public function update():void 
		{
			if (FlxG.keys.ESCAPE) {
				menuMode();
			}
			super.update();
		}
		
		private function menuMode():void
		{
			FlxG.switchState(new MenuState);
		}
		
		override public function draw():void
		{
			background.draw();
			super.draw();
		}
	}
}
