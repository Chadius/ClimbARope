package
{
	import org.flixel.*;	

	public class CreditsState extends FlxState
	{
		[Embed (source = "../assets/credits.png")] private var credit_img:Class;
		public var background:FlxSprite;
		private var menuButton:FlxButton;
		
		public function CreditsState()
		{
			background = new FlxSprite(0, 0, credit_img);
		}
		
		override public function create():void
		{
			FlxG.mouse.show();
			menuButton = new FlxButton(400, 550, "Back to Menu", menuMode);
			add(menuButton);
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
