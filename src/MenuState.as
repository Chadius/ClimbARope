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
		private var startInstructions:MenuText;
		private var creditsInstructions:MenuText;
		
		private static const DEMO_BUTTON:int = 0;
		private static const START_BUTTON:int = 1;
		private static const CREDITS_BUTTON:int = 2;
		
		public function MenuState()
		{
			
		}

		override public function create():void
		{
			FlxG.mouse.hide();
			startInstructions = new MenuText("Press Enter to start.", 75, 400, 0xAADDDDDD);
			creditsInstructions = new MenuText("Press C to view credits.", 75, 500, 0xAADD3333);
			TitleText.Initialize();
			add(startInstructions.textField);
			add(creditsInstructions.textField);
			add(TitleText.textField);
			activeButton = 1;
		}
		
		override public function update():void 
		{
			if (FlxG.keys.ENTER) {
				startGame();
			}
			if (FlxG.keys.C) {
				showCredits();
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