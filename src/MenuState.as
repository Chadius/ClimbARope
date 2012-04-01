package
{
	import org.flixel.*;
		
	public class MenuState extends FlxState
	{
		private var startButton:FlxButton;
		private var creditsButton:FlxButton;
		private var exitButton:FlxButton;
		private var demoButton:FlxButton;
		private var activeButton:int;
		private var startInstructions:HelpText;
		
		private static const DEMO_BUTTON:int = 0;
		private static const START_BUTTON:int = 1;
		private static const CREDITS_BUTTON:int = 2;
		
		public function MenuState()
		{
			
		}

		override public function create():void
		{
			FlxG.mouse.show();
			demoButton = new FlxButton(90, 200, "Demo", demoMode);
			startButton = new FlxButton(90, 225, "Start Game", startGame);
			creditsButton = new FlxButton(90, 250, "Credits", showCredits);
			startInstructions = new HelpText("Press Enter or Space to start.", 90, 400);
			add(demoButton);
			add(startButton);
			add(creditsButton);
			add(startInstructions.textField);
			activeButton = 1;
		}
		
		override public function update():void 
		{
			if (FlxG.keys.ENTER || FlxG.keys.SPACE) {
				startGame();
			}
			super.update();
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
			FlxG.switchState(new CreditsState);
		}
	}
}