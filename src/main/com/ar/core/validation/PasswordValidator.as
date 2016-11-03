package com.ar.core.validation
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class PasswordValidator
	{
		/**
		 *
		 */
		public static function isLengthValid( str:String ):Boolean
		{
			return !(str.length < 5 || str.length > 20);
		}

		/**
		 *
		 */
		public static function getStrength( str:String ):Number
		{
			if( str == null || str.length == 0 )
			{
				return 0.0;
			}

			var points:Number = 0;

			if( str.length > 3 )
			{
				points += 3;
			}
			if( str.length > 5 )
			{
				points += 3;
			}
			if( str.length > 8 )
			{
				points += 3;
			}
			if( str.length > 12 )
			{
				points += 3;
			}
			if( str.length > 15 )
			{
				points += 3;
			}

			var numLowerCase:int = countOccurrence( str, /[a-z]/g );
			var numUpperCase:int = countOccurrence( str, /[A-Z]/g );
			var numDigits:int = countOccurrence( str, /[\d]/g );
			var numSpecial:int = countOccurrence( str, /[!,@,#,$,%,^,&,*,?,_,~,=,\[,\],\+\-]/g );

			if( numLowerCase > 0 )
			{
				points += 1;
			}

			if( numUpperCase > 0 )
			{
				points += 5;
			}

			if( numDigits > 0 )
			{
				points += 5;
			}

			if( numSpecial > 0 )
			{
				points += 5;
			}

			if( numLowerCase > 0 && numUpperCase > 0 )
			{
				points += 2;
			}

			if( numLowerCase > 0 && numUpperCase > 0 && numDigits > 0 )
			{
				points += 2;
			}

			if( numLowerCase > 0 && numUpperCase > 0 && numDigits > 0 && numSpecial > 0 )
			{
				points += 2;
			}

			return ( points / 37.0 );
		}

		/**
		 *
		 */
		private static function countOccurrence( str:String, regexp:RegExp ):int
		{
			const result:Array = str.match( regexp );

			return ( ( result != null ) ? result.length : 0 );
		}

		/**
		 * Creates a new instance of PasswordValidator.
		 */
		public function PasswordValidator()
		{
			throw new Error( "PasswordValidator class is static container only" );
		}

		/**
		 * Creates and returns a string representation of the PasswordValidator object.
		 */
		public function toString():String
		{
			return "[PasswordValidator]";
		}
	}
}