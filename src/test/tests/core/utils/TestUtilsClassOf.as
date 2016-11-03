package tests.core.utils
{
	import com.ar.core.utils.getClassOf;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestUtilsClassOf
	{

		public function TestUtilsClassOf()
		{
		}

		[Test(description="")]
		public function test():void
		{
			var o1:String = new String();
			var c:Class = getClassOf( o1 );
			var o2:* = new c();

			var result:Boolean = false;

			if( o1 is c && o2 is c && o2 is String )
			{
				result = true;
			}

			Assert.assertEquals( true, result );
		}

		public function toString():String
		{
			return "[TestUtilsClassOf]";
		}
	}
}