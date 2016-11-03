package tests.core.utils
{
	import com.ar.core.utils.ArrayUtils;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestUtilsArrayUtil
	{
		public function TestUtilsArrayUtil()
		{
		}

		[Test(description="Test Array is equal")]
		public function testCompare():void
		{
			Assert.assertEquals( true, ArrayUtils.isEqual( [], [] ) );
			Assert.assertEquals( true, ArrayUtils.isEqual( ["a"], ["a"] ) );
			Assert.assertEquals( true, ArrayUtils.isEqual( ["a", "a"], ["a", "a"] ) );
			Assert.assertEquals( false, ArrayUtils.isEqual( [""], ["a"] ) );
			Assert.assertEquals( false, ArrayUtils.isEqual( ["", "a"], ["a", "a"] ) );
			Assert.assertEquals( false, ArrayUtils.isEqual( ["a"], ["a", "a"] ) );
		}

		[Test(description="Test Array reverse")]
		public function testReverse():void
		{
			assertCompareArray( [], ArrayUtils.reverse( [] ) );
			assertCompareArray( ["a"], ArrayUtils.reverse( ["a"] ) );
			assertCompareArray( ["c", "b", "a"], ArrayUtils.reverse( ["a", "b", "c"] ) );
		}

		[Test(description="Test Array permute")]
		public function testPermute():void
		{
			var result:Vector.<Array>;
			var expected:Vector.<Array>;
			var n:int;

			//empty
			result = ArrayUtils.permute( [] );
			expected = new Vector.<Array>();
			expected.push( [] );

			Assert.assertEquals( expected.length, result.length );

			n = result.length;

			while( --n > -1 )
			{
				assertCompareArray( expected[n], result[n] );
			}


			//single
			result = ArrayUtils.permute( ["a"] );
			expected = new Vector.<Array>();
			expected.push( ["a"] );

			Assert.assertEquals( expected.length, result.length );

			n = result.length;

			while( --n > -1 )
			{
				assertCompareArray( expected[n], result[n] );
			}


			//multiple
			result = ArrayUtils.permute( ["a", "b", "c"] );
			expected = new Vector.<Array>();
			expected.push( ["a", "b", "c"] );
			expected.push( ["a", "c", "b"] );
			expected.push( ["b", "a", "c"] );
			expected.push( ["b", "c", "a"] );
			expected.push( ["c", "b", "a"] );
			expected.push( ["c", "a", "b"] );

			Assert.assertEquals( expected.length, result.length );

			n = result.length;

			while( --n > -1 )
			{
				assertCompareArray( expected[n], result[n] );
			}
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
			return "[TestUtilsArrayUtil]";
		}
	}
}