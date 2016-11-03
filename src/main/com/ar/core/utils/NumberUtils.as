package com.ar.core.utils
{
	import com.ar.core.error.ValueError;

	/**
	 * A collection of static util functions associated with numbers.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class NumberUtils
	{
		/**
		 * Return a string representation of the given integer value.
		 * Digits is the total (minimum) amount of digits the resulting value will have.
		 * If digits is set to 4, 0001 will be returned for the value 1 AND 12345 will be returned for 12345.
		 *
		 * @author Alan Ross
		 * @version 0.1
		 */
		public static function intToDigits( value:int, digits:int = 2 ):String
		{
			if( digits < 1 || digits > 10 )
			{
				throw new ValueError( "Choose a value for digits between 1 and 10" );
			}

			var negative:Boolean = ( value < 0 );

			var dezCount:int = 1;

			var result:String = "";

			value = Math.abs( value );

			while( --digits > 0 )
			{
				if( value < ( dezCount *= 10 ) )
				{
					result += "0";
				}
			}

			return ( negative ) ? ( "-" + result + value ) : ( result + value );
		}


		/**
		 * Creates a new instance of NumberUtils.
		 */
		public function NumberUtils()
		{
			throw new Error( "NumberUtils class is static container only." );
		}

		/**
		 * Generates and returns the string representation of the NumberUtils object.
		 */
		public function toString():String
		{
			return "[NumberUtils]";
		}
	}
}