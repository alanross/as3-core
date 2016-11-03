package com.ar.core.validation
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class EmailValidator
	{
		/**
		 *
		 */
		public static function isValidEmail( str:String ):Boolean
		{
			const pattern:RegExp = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,5}$/;

			//const pattern:RegExp = /[a-z0-9\\._%+-]+@[a-z0-9\\.-]+\\.[a-z]+/;
			//return (email != null) && (email.toLowerCase().trim().matches(b));

			return pattern.exec( str.toLowerCase() );
		}

		/**
		 * Creates a new instance of EmailValidator.
		 */
		public function EmailValidator()
		{
			throw new Error( "EmailValidator class is static container only" );
		}

		/**
		 * Creates and returns a string representation of the EmailValidator object.
		 */
		public function toString():String
		{
			return "[EmailValidator]";
		}
	}
}