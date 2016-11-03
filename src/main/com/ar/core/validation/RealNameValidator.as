package com.ar.core.validation
{

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class RealNameValidator
	{
		/**
		 *
		 */
		public static function isValid( str:String ):Boolean
		{
			const pattern:RegExp = /^[\w\-_]+$/;
			//const pattern:RegExp = /^[^\x00-\x1F\x7F<>]+$/; // also allow white space etc. is less restrictive

			if( !pattern.exec( str ) )
			{
				return false;
			}

			return !(str.length < 2 || str.length > 60);
		}

		/**
		 * Creates a new instance of RealNameValidator.
		 */
		public function RealNameValidator()
		{
			throw new Error( "RealNameValidator class is static container only" );
		}

		/**
		 * Creates and returns a string representation of the RealNameValidator object.
		 */
		public function toString():String
		{
			return "[RealNameValidator]";
		}
	}
}