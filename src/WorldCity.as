package  
{
	/**
	 * ...
	 * @author JR
	 */
	public class WorldCity extends World 
	{
		
		public function WorldCity() 
		{
			//Define each level
			//testing only!
			var i:int;
			levels = new Vector.<Level>;
			for (i = 0; i < 10; i++) 
			{
				levels.push(new Level(i));
			}
		}
		
	}

}