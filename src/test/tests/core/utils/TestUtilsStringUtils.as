package tests.core.utils
{
	import com.ar.core.utils.StringUtils;

	import org.flexunit.Assert;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TestUtilsStringUtils
	{
		public function TestUtilsStringUtils()
		{
		}

		[Test(description="Test String reverse")]
		public function testReverse():void
		{
			Assert.assertEquals( "", StringUtils.reverse( "" ) );
			Assert.assertEquals( "a", StringUtils.reverse( "a" ) );
			Assert.assertEquals( "cba", StringUtils.reverse( "abc" ) );
		}

		[Test(description="Test String string to array")]
		public function testStringToArray():void
		{
			assertCompareArray( [""], StringUtils.stringToArray( "" ) );
			assertCompareArray( ["a"], StringUtils.stringToArray( "a" ) );
			assertCompareArray( ["a", "b", "c"], StringUtils.stringToArray( "abc" ) );
		}

		[Test(description="Test String array to string")]
		public function testArrayToString():void
		{
			var resultString:String;
			var expectedString:String;

			//single char
			resultString = StringUtils.arrayToString( [""], "" );
			expectedString = "";

			Assert.assertEquals( expectedString, resultString );

			resultString = StringUtils.arrayToString( ["a", "b", "c"], "" );
			expectedString = "abc";

			Assert.assertEquals( expectedString, resultString );
		}

		[Test(description="Test String is empty string")]
		public function testIsEmpty():void
		{
			Assert.assertEquals( true, StringUtils.isEmpty( "" ) );
			Assert.assertEquals( true, StringUtils.isEmpty( " " ) );
			Assert.assertEquals( true, StringUtils.isEmpty( "   " ) );

			Assert.assertEquals( false, StringUtils.isEmpty( "a " ) );
			Assert.assertEquals( false, StringUtils.isEmpty( " a" ) );
			Assert.assertEquals( false, StringUtils.isEmpty( " a " ) );

			Assert.assertEquals( true, StringUtils.isEmpty( "\n" ) );
			Assert.assertEquals( true, StringUtils.isEmpty( "\t" ) );
			Assert.assertEquals( true, StringUtils.isEmpty( "\r" ) );

			Assert.assertEquals( true, StringUtils.isEmpty( "\n " ) );
			Assert.assertEquals( true, StringUtils.isEmpty( "\t " ) );
			Assert.assertEquals( true, StringUtils.isEmpty( "\r " ) );

			Assert.assertEquals( true, StringUtils.isEmpty( " \n" ) );
			Assert.assertEquals( true, StringUtils.isEmpty( " \t" ) );
			Assert.assertEquals( true, StringUtils.isEmpty( " \r" ) );

			Assert.assertEquals( true, StringUtils.isEmpty( " \n " ) );
			Assert.assertEquals( true, StringUtils.isEmpty( " \t " ) );
			Assert.assertEquals( true, StringUtils.isEmpty( " \r " ) );

			Assert.assertEquals( false, StringUtils.isEmpty( "a\n" ) );
			Assert.assertEquals( false, StringUtils.isEmpty( "a\t" ) );
			Assert.assertEquals( false, StringUtils.isEmpty( "a\r" ) );

			Assert.assertEquals( false, StringUtils.isEmpty( "\na" ) );
			Assert.assertEquals( false, StringUtils.isEmpty( "\ta" ) );
			Assert.assertEquals( false, StringUtils.isEmpty( "\ra" ) );

			Assert.assertEquals( false, StringUtils.isEmpty( "a\na" ) );
			Assert.assertEquals( false, StringUtils.isEmpty( "a\ta" ) );
			Assert.assertEquals( false, StringUtils.isEmpty( "a\ra" ) );
		}

		[Test(description="Test String is numeric")]
		public function testIsNumeric():void
		{
			Assert.assertEquals( false, StringUtils.isNumeric( "" ) );
			Assert.assertEquals( false, StringUtils.isNumeric( "a" ) );
			Assert.assertEquals( false, StringUtils.isNumeric( " 1a" ) );
			Assert.assertEquals( false, StringUtils.isNumeric( " 1" ) );

			Assert.assertEquals( false, StringUtils.isNumeric( "01" ) );

			Assert.assertEquals( true, StringUtils.isNumeric( "1" ) );
			Assert.assertEquals( true, StringUtils.isNumeric( "10" ) );
			Assert.assertEquals( true, StringUtils.isNumeric( "101" ) );
		}

		[Test(description="Test String trim")]
		public function testTrim():void
		{
			Assert.assertEquals( "", StringUtils.trim( "" ) );
			Assert.assertEquals( "", StringUtils.trim( " " ) );
			Assert.assertEquals( "", StringUtils.trim( "   " ) );
			Assert.assertEquals( "a", StringUtils.trim( "a" ) );
			Assert.assertEquals( "a", StringUtils.trim( "a " ) );
			Assert.assertEquals( "a", StringUtils.trim( " a" ) );
			Assert.assertEquals( "a", StringUtils.trim( "a   " ) );
			Assert.assertEquals( "a", StringUtils.trim( "  a" ) );
			Assert.assertEquals( "a", StringUtils.trim( " a " ) );
			Assert.assertEquals( "a", StringUtils.trim( "a\n" ) );
			Assert.assertEquals( "a", StringUtils.trim( "a\r" ) );
			Assert.assertEquals( "a", StringUtils.trim( "a\t" ) );
			Assert.assertEquals( "a", StringUtils.trim( "\na" ) );
			Assert.assertEquals( "a", StringUtils.trim( "\ra" ) );
			Assert.assertEquals( "a", StringUtils.trim( "\ta" ) );
			Assert.assertEquals( "a a", StringUtils.trim( "a a" ) );
			Assert.assertEquals( "a a", StringUtils.trim( " a a" ) );
			Assert.assertEquals( "a a", StringUtils.trim( "a a " ) );
		}

		[Test(description="Test String strip special chars")]
		public function testStripSpecialChars():void
		{
			Assert.assertEquals( "", StringUtils.stripSpecialChars( "" ) );
			Assert.assertEquals( "a", StringUtils.stripSpecialChars( "a" ) );
			Assert.assertEquals( "abc", StringUtils.stripSpecialChars( "abc" ) );

			Assert.assertEquals( "", StringUtils.stripSpecialChars( "\f" ) );
			Assert.assertEquals( "", StringUtils.stripSpecialChars( "\n" ) );
			Assert.assertEquals( "", StringUtils.stripSpecialChars( "\r" ) );
			Assert.assertEquals( "", StringUtils.stripSpecialChars( "\t" ) );
			Assert.assertEquals( "", StringUtils.stripSpecialChars( "\v" ) );

			Assert.assertEquals( "a", StringUtils.stripSpecialChars( "a\f" ) );
			Assert.assertEquals( "a", StringUtils.stripSpecialChars( "a\n" ) );
			Assert.assertEquals( "a", StringUtils.stripSpecialChars( "a\r" ) );
			Assert.assertEquals( "a", StringUtils.stripSpecialChars( "a\t" ) );
			Assert.assertEquals( "a", StringUtils.stripSpecialChars( "a\v" ) );

			Assert.assertEquals( "a", StringUtils.stripSpecialChars( "\fa" ) );
			Assert.assertEquals( "a", StringUtils.stripSpecialChars( "\na" ) );
			Assert.assertEquals( "a", StringUtils.stripSpecialChars( "\ra" ) );
			Assert.assertEquals( "a", StringUtils.stripSpecialChars( "\ta" ) );
			Assert.assertEquals( "a", StringUtils.stripSpecialChars( "\va" ) );

			Assert.assertEquals( "aa", StringUtils.stripSpecialChars( "a\fa" ) );
			Assert.assertEquals( "aa", StringUtils.stripSpecialChars( "a\na" ) );
			Assert.assertEquals( "aa", StringUtils.stripSpecialChars( "a\ra" ) );
			Assert.assertEquals( "aa", StringUtils.stripSpecialChars( "a\ta" ) );
			Assert.assertEquals( "aa", StringUtils.stripSpecialChars( "a\va" ) );

			Assert.assertEquals( "aaa", StringUtils.stripSpecialChars( "a\fa\f\fa" ) );
			Assert.assertEquals( "aaa", StringUtils.stripSpecialChars( "a\na\n\na" ) );
			Assert.assertEquals( "aaa", StringUtils.stripSpecialChars( "a\ra\r\ra" ) );
			Assert.assertEquals( "aaa", StringUtils.stripSpecialChars( "a\ta\t\ta" ) );
			Assert.assertEquals( "aaa", StringUtils.stripSpecialChars( "a\va\v\va" ) );
		}

		[Test(description="Test String strip html chars")]
		public function testStripHTMLChars():void
		{
			Assert.assertEquals( "", StringUtils.stripHtmlTags( "<a>" ) );
			Assert.assertEquals( "", StringUtils.stripHtmlTags( "</a>" ) );
			Assert.assertEquals( "", StringUtils.stripHtmlTags( "<a><a>" ) );

			Assert.assertEquals( "b", StringUtils.stripHtmlTags( "<a>b" ) );
			Assert.assertEquals( "b", StringUtils.stripHtmlTags( "</a>b" ) );
			Assert.assertEquals( "b", StringUtils.stripHtmlTags( "<a><a>b" ) );

			Assert.assertEquals( "b", StringUtils.stripHtmlTags( "b<a>" ) );
			Assert.assertEquals( "b", StringUtils.stripHtmlTags( "b</a>" ) );
			Assert.assertEquals( "b", StringUtils.stripHtmlTags( "b<a><a>" ) );

			Assert.assertEquals( "bb", StringUtils.stripHtmlTags( "b<a>b" ) );
			Assert.assertEquals( "bb", StringUtils.stripHtmlTags( "b</a>b" ) );
			Assert.assertEquals( "bb", StringUtils.stripHtmlTags( "b<a><a>b" ) );
			Assert.assertEquals( "bbb", StringUtils.stripHtmlTags( "b<a>b<a>b" ) );

			Assert.assertEquals( "", StringUtils.stripHtmlTags( "<a a=a>" ) );
			Assert.assertEquals( "", StringUtils.stripHtmlTags( "<a a=>" ) );
			Assert.assertEquals( "", StringUtils.stripHtmlTags( "<a aa>" ) );
		}

		[Test(description="Test String get byte length")]
		public function testByteLength():void
		{
			Assert.assertEquals( 0, StringUtils.getByteLength( "" ) );
			Assert.assertEquals( 1, StringUtils.getByteLength( "1" ) );
			Assert.assertEquals( 1, StringUtils.getByteLength( "a" ) );
			Assert.assertEquals( 2, StringUtils.getByteLength( "11" ) );
			Assert.assertEquals( 3, StringUtils.getByteLength( " 11" ) );
			Assert.assertEquals( 3, StringUtils.getByteLength( "11 " ) );
			Assert.assertEquals( 3, StringUtils.getByteLength( "1 1" ) );
		}

		[Test(description="Test String get Levenshtein distance")]
		public function testLevenshteinDistance():void
		{
			Assert.assertEquals( 0, StringUtils.getLevenshteinDistance( "", "" ) );
			Assert.assertEquals( 0, StringUtils.getLevenshteinDistance( "a", "a" ) );
			Assert.assertEquals( 0, StringUtils.getLevenshteinDistance( "ab", "ab" ) );

			Assert.assertEquals( 1, StringUtils.getLevenshteinDistance( "abc", "ab" ) );
			Assert.assertEquals( 1, StringUtils.getLevenshteinDistance( "abc", "abd" ) );

			Assert.assertEquals( 2, StringUtils.getLevenshteinDistance( "abc", "a" ) );
			Assert.assertEquals( 2, StringUtils.getLevenshteinDistance( "abc", "c" ) );
			Assert.assertEquals( 2, StringUtils.getLevenshteinDistance( "abc", "b" ) );

			Assert.assertEquals( 3, StringUtils.getLevenshteinDistance( "abc", "" ) );
			Assert.assertEquals( 3, StringUtils.getLevenshteinDistance( "abc", "abcdef" ) );
			Assert.assertEquals( 3, StringUtils.getLevenshteinDistance( "abc", "abcbbb" ) );

			Assert.assertEquals( 2, StringUtils.getLevenshteinDistance( "ring", "aringa" ) );
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
			return "[TestUtilsStringUtils]";
		}
	}
}