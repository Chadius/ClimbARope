package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Chad Serrant
	 * 
	 * Base Class for projectiles that can harm the player.
	 */
	public class EnemyProjectile extends FlxSprite
	{
		
		public function EnemyProjectile(x:int, y:int) 
		{
			super(x, y);
		}
		
		public function fail():void
		{
		}
		
		override public function update():void
		{
		}
	}
}