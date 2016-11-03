package tests.core.utils
{
	import com.ar.core.utils.DictUtils;

	import flash.utils.Dictionary;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestUtilsDictUtil
	{
		public function TestUtilsDictUtil()
		{
		}

		[Test(description="")]
		public function testGetAllKeys():void
		{
			var dict:Dictionary = new Dictionary();

			dict[ "a" ] = 1;
			dict[ "b" ] = 2;
			dict[ "c" ] = 3;

			var expected:Array = [ "a", "b", "c"];
			var result:Array = DictUtils.getKeys( dict );

			result.sort();

			assertCompareArray( expected, result );
		}

		[Test(description="")]
		public function testGetAllValues():void
		{
			var dict:Dictionary = new Dictionary();

			dict[ "a" ] = 1;
			dict[ "b" ] = 2;
			dict[ "c" ] = 3;

			var expected:Array = [ 1, 2, 3 ];
			var result:Array = DictUtils.getValues( dict );

			result.sort();

			assertCompareArray( expected, result );
		}

		private function assertCompareArray( a:Array, b:Array ):void
		{
			Assert.assertEquals( a.length, b.length );

			var n:int = a.length;

			while( --n > -1 )
			{
				Assert.assertEquals( a[n], b[n] );
			}
		}

		public function toString():String
		{
			return "[TestUtilsDictUtil]";
		}
	}
}