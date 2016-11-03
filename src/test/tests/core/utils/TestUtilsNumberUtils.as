package tests.core.utils
{
	import com.ar.core.utils.NumberUtils;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestUtilsNumberUtils
	{
		public function TestUtilsNumberUtils()
		{
		}

		[Test(description="")]
		public function test():void
		{
			Assert.assertEquals( "1", NumberUtils.intToDigits( 1, 1 ) );
			Assert.assertEquals( "11", NumberUtils.intToDigits( 11, 1 ) );
			Assert.assertEquals( "111", NumberUtils.intToDigits( 111, 1 ) );

			Assert.assertEquals( "0001", NumberUtils.intToDigits( 1, 4 ) );
			Assert.assertEquals( "0012", NumberUtils.intToDigits( 12, 4 ) );
			Assert.assertEquals( "0123", NumberUtils.intToDigits( 123, 4 ) );
			Assert.assertEquals( "1234", NumberUtils.intToDigits( 1234, 4 ) );
			Assert.assertEquals( "12345", NumberUtils.intToDigits( 12345, 4 ) );

			Assert.assertEquals( "-0001", NumberUtils.intToDigits( -1, 4 ) );
			Assert.assertEquals( "-0012", NumberUtils.intToDigits( -12, 4 ) );
			Assert.assertEquals( "-0123", NumberUtils.intToDigits( -123, 4 ) );
			Assert.assertEquals( "-1234", NumberUtils.intToDigits( -1234, 4 ) );
			Assert.assertEquals( "-12345", NumberUtils.intToDigits( -12345, 4 ) );
		}

		public function toString():String
		{
			return "[TestUtilsGetIntWithDigitCount]";
		}
	}
}