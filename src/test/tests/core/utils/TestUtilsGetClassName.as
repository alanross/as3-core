package tests.core.utils
{
	import com.ar.core.utils.getClassName;

	import flash.display.Sprite;
	import flash.events.Event;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestUtilsGetClassName
	{
		public function TestUtilsGetClassName()
		{
		}

		[Test(description="")]
		public function test():void
		{
			Assert.assertEquals( "Object", getClassName( new Object() ) );
			Assert.assertEquals( "String", getClassName( new String() ) );
			Assert.assertEquals( "Date", getClassName( new Date() ) );
			Assert.assertEquals( "flash.events.Event", getClassName( new Event( "" ) ) );
			Assert.assertEquals( "flash.display.Sprite", getClassName( new Sprite() ) );
		}

		public function toString():String
		{
			return "[TestUtilsGetClassName]";
		}
	}
}