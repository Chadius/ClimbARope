package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author JR
	 */
	public class World extends PlayState 
	{
		public var levels:Vector.<Level>;				//refers to all the levels within the world
		public var currentLevel:Level;					//refers to the currently active level
		
		public function WorldState():void
		{

		}
		
		override public function create():void
		{
			currentLevel = levels.shift();				//pulls the first level off the queue
		}
		
		override public function update():void
		{
			if (currentLevel.levelComplete)
			{
				nextLevel();
			}
			else
			{
				currentLevel.update();
			}
			
			//draw();
		}
		
		override public function draw():void
		{
			currentLevel.draw();
		}
		
		private function nextLevel():void
		{
			if (levels.length > 0)
			{
				currentLevel = levels.shift();
				
			}
			else
			{
				worldComplete();
			}
		}
		
		private function worldComplete():void
		{
			FlxG.switchState(new PlayState);
		}
	}

}