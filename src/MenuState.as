package
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		private var startButton:FlxButton;
		private var creditsButton:FlxButton;
		private var exitButton:FlxButton;
		private var demoButton:FlxButton;
		
		public function MenuState()
		{
			
		}

		override public function create():void
		{
			FlxG.mouse.show();
			demoButton = new FlxButton(90, 200, "Demo", demoMode);
			startButton = new FlxButton(90, 225, "Start Game", startGame);
			creditsButton = new FlxButton(90, 250, "Credits", showCredits);
			exitButton = new FlxButton(90, 275, "Exit", exitGame);
			add(demoButton);
			add(startButton);
			add(creditsButton);
			add(exitButton);
		}

		private function demoMode():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new TestState);
		}
		
		private function startGame():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new WorldCity);
		}
		
		private function showCredits():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new PlayState);
		}
		
		private function exitGame():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new PlayState);
		}
	}
}