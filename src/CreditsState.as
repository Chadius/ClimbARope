package
{
	import org.flixel.*;	

	public class CreditsState extends FlxState
	{
		[Embed (source = "../assets/credits.png")] private var credit_img:Class;
		public var background:FlxSprite;
		private var backToMenuInstructions:MenuText;
		
		public var creditList1:Vector.<MenuText> = new Vector.<MenuText>;
		public var creditList2:Vector.<MenuText> = new Vector.<MenuText>;
		public var creditList3:Vector.<MenuText> = new Vector.<MenuText>;
		
		public function CreditsState()
		{
			background = new FlxSprite(0, 0, credit_img);
		}
		
		override public function create():void
		{
			FlxG.mouse.show();
			backToMenuInstructions = new MenuText("Press ESC to return to menu.", 90, 700, 0xAADD3333);
			add(backToMenuInstructions.textField);
			
			var top:int = 50;
			creditList1.push(new MenuText("Brought to you by:", 100, top, 0xDBDD56));
			creditList1.push(new MenuText("3 Mad, Bad, and Crazy dudes!", 50, top + 30, 0xDADD33));
			creditList1.push(new MenuText("Brendan Mcloughlin", 20, top + 120, 0xEFEFEF));
			creditList1.push(new MenuText("Jonathan Rubinger", 20, top + 150, 0xEFEFEF));
			creditList1.push(new MenuText("Chad Serrant", 20, top + 180, 0xEFEFEF));
			
			for each(var mt:MenuText in creditList1)
				add(mt.textField);
			
			top = 320
			creditList2.push(new MenuText("Also, awesome audio assist from:", 100, top, 0xDADD33));
			creditList2.push(new MenuText("Rick Cody: Composer (iOS GarageBand)", 50, top + 80, 0xEFEFEF));
			creditList2.push(new MenuText("Miles Flanagan: Sound Design", 20, top + 160, 0xEFEFEF));
			for each(var mt:MenuText in creditList2)
				add(mt.textField);
				
			creditList3.push(new MenuText("And most importantly, YOU!", 300, 600, 0xDADD33));
			
			FlxG.mouse.hide();
		}
		
		override public function update():void 
		{
			FlxG.mouse.hide();
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
