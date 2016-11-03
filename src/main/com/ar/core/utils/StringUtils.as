package com.ar.core.utils
{
	import com.ar.core.error.NullError;

	import flash.utils.ByteArray;

	/**
	 * A collection of static util functions associated with strings.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class StringUtils
	{
		/**
		 * Return a string object representing a concatenation of all given values in the given array.
		 */
		public static function stringToArray( str:String ):Array
		{
			return str.split( "" );
		}

		/**
		 * Returns a string vector holding all tokens which were found by using the token separator in the given string.
		 */
		public static function stringTokensToVector( str:String, tokenSeparator:String = "," ):Vector.<String>
		{
			const array:Array = str.split( tokenSeparator );

			var result:Vector.<String> = new Vector.<String>();

			// remove leading and trailing spaces
			const reg:RegExp = /^\s+|\s+$/g;

			const n:int = array.length;

			var token:String;

			for( var i:int = 0; i < n; ++i )
			{
				token = array[i].replace( reg, "" );

				if( !isEmpty( token ) )
				{
					result.push( token );
				}
			}

			return result;
		}

		/**
		 * Joings al values in the given string vector and returns them as a single string object.
		 * The single values are joined with the given separator ("a,b" if "," is used as separator).
		 */
		public static function vectorToString( input:Vector.<String>, separator:String = "," ):String
		{
			return input.join( separator );
		}

		/**
		 * Return an array containing single chars of the given string.
		 */
		public static function arrayToString( input:Array, separator:String = "," ):String
		{
			return input.join( separator );
		}

		/**
		 * Creates and returns a formatted string representation of an object and
		 * its properties.
		 *
		 * @param object The object holding the values.
		 * @param properties A list of public properties the object stores. Those
		 * properties have to be accessable from the outside of the class.
		 */
		public static function objectToString( object:Object, ...properties ):String
		{
			const name:String = getClassName( object );
			const index:int = name.lastIndexOf( "." );

			var output:String = "[" + (( -1 == index ) ? name : name.substring( index + 1 ));

			var i:int = 0;

			const n:int = properties.length;
			const m:int = n - 1;

			var prop:String;

			for( ; i < n; ++i )
			{
				prop = properties[ i ];

				output += " " + prop + ": ";

				try
				{
					output += object[ prop ];
				}
				catch( error:Error )
				{
					output += "(" + error.message + ")";
				}

				if( i != m )
				{
					output += ",";
				}
			}

			output += "]";

			return output;
		}

		/**
		 * Returns true if the given string is empty after trimming empty characters from it.
		 */
		public static function isEmpty( str:String ):Boolean
		{
			if( str == null || str.length == 0 )
			{
				return true;
			}

			return trim( str ).length == 0;
		}

		/**
		 * Returns true if given string is a numeric (integer) value.
		 * Note 01 will return false.
		 */
		public static function isNumeric( str:String ):Boolean
		{
			// does not accept values such as 0.1 or 01
			var obj:RegExp = /^(0|[1-9][0-9]*)$/;
			return obj.test( str );
		}

		/**
		 * Trim a given string by removing leading or trailing spaces.
		 */
		public static function trim( str:String ):String
		{
			// remove leading and trailing spaces
			const reg:RegExp = /^\s+|\s+$/g;

			return str.replace( reg, "" );
		}

		/**
		 * Remove or replace special characters in a given string.
		 */
		public static function stripSpecialChars( str:String, replacement:String = "" ):String
		{
			return str.replace( RegExp( /[\f\n\r\t\v]/gm ), replacement );
		}

		/**
		 * Remove or replace html tags in a given string.
		 */
		public static function stripHtmlTags( str:String, replacement:String = "" ):String
		{
			return str.replace( RegExp( /<.*?>/g ), replacement );
		}

		/**
		 * Escape the xml tags in a given string.
		 */
		public static function escapeXML( str:String ):String
		{
			var result:String = str;

			result = result.replace( /&/ig, "&amp;" );

			while( result.indexOf( "<" ) != -1 )
			{
				result = result.replace( "<", "&lt;" );
			}
			while( result.indexOf( ">" ) != -1 )
			{
				result = result.replace( ">", "&gt;" );
			}

			return result;
		}

		/**
		 *
		 */
		private static function strWidth( str:String ):int
		{
			//thin letters: [^iIl1\\.,"]
			return ( str.length - str.replace( /[^iIl1\\.,"]/g, "" ).length / 2 );
		}

		/**
		 * http://stackoverflow.com/questions/3597550/ideal-method-to-truncate-a-string-with-ellipsis
		 */
		public static function ellipsis( str:String, maxLength:int ):String
		{
			if( strWidth( str ) <= maxLength )
			{
				return str;
			}

			// Start by chopping off at the word before max
			// This is an over-approximation due to thin-characters...
			var end:int = str.lastIndexOf( " ", maxLength - 3 );

			// Just one long word. Chop it off.
			if( end == -1 )
			{
				return str.substring( 0, maxLength - 3 ) + "...";
			}

			// Step forward as long as textWidth allows.
			var newEnd:int = end;

			do {
				end = newEnd;

				newEnd = str.indexOf( " ", end + 1 );

				// No more spaces.
				if( newEnd == -1 )
				{
					newEnd = str.length;
				}

			} while( strWidth( str.substring( 0, newEnd ) + "..." ) < maxLength );

			return str.substring( 0, end ) + "...";
		}

		/**
		 * Reversing entire string.
		 */
		public static function reverse( str:String ):String
		{
			return ArrayUtils.reverse( str.split( "" ) ).join( "" );
		}

		/**
		 * Returns the Levenshtein distance of a given string.
		 */
		public static function getLevenshteinDistance( a:String, b:String ):int
		{
			if( a == null || b == null )
			{
				throw new NullError( "Strings for Levenshtein distance must not be null" );
			}

			const m:int = a.length;
			const n:int = b.length;

			var i:int;
			var j:int;

			var matrix:Array = new Array();

			for( i = 0; i <= m; ++i )
			{
				var line:Array = new Array();

				for( j = 0; j <= n; ++j )
				{
					line.push( ( ( i != 0 ) ? 0 : j ) )
				}

				line[0] = i;

				matrix.push( line );
			}

			for( i = 1; i <= m; ++i )
			{
				for( j = 1; j <= n; ++j )
				{
					var cost:int = ( a.charAt( i - 1 ) == b.charAt( j - 1 ) ) ? 0 : 1;

					matrix[i][j] = Math.min( Math.min( matrix[i - 1][j] + 1, matrix[i][j - 1] + 1 ), matrix[i - 1][j - 1] + cost );
				}
			}

			return matrix[m][n];
		}

		/**
		 * Returns the byte length of a given string.
		 */
		public static function getByteLength( string:String ):int
		{
			const buffer:ByteArray = new ByteArray();

			buffer.writeUTFBytes( string );

			return buffer.length;
		}

		public static function randomSequence( size:int ):String
		{
			const chars:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
			const charsCount:int = chars.length - 1;

			var result:String = "";

			for( var i:int = 0; i < size; ++i )
			{
				result += chars.charAt( Math.round( Math.random() * charsCount ) );
			}

			return result;
		}


		/**
		 * StringUtils class is static container only.
		 */
		public function StringUtils()
		{
			throw new Error( "StringUtils class is static container only." );
		}

		/**
		 * Creates and returns a string representation of the StringUtils object.
		 */
		public function toString():String
		{
			return "[StringUtils]";
		}
	}
}
