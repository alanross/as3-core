package com.ar.core.validation
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class UserNameValidator
	{
		/**
		 *
		 */
		public static function isValid( str:String ):Boolean
		{
			const pattern:RegExp = /^[\w\-_]+$/;

			if( !pattern.exec( str ) )
			{
				return false;
			}

			return !(str.length < 2 || str.length > 20);
		}

		/**
		 * Creates a new instance of UserNameValidator.
		 */
		public function UserNameValidator()
		{
			throw new Error( "UserNameValidator class is static container only" );
		}

		/**
		 * Creates and returns a string representation of the UserNameValidator object.
		 */
		public function toString():String
		{
			return "[UserNameValidator]";
		}
	}
}