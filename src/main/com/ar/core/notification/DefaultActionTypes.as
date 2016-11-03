package com.ar.core.notification
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class DefaultActionTypes
	{
		public static const DEFAULT:String = "DEFAULT";

		/**
		 * Creates a new instance of DefaultActionTypes.
		 */
		public function DefaultActionTypes()
		{
			throw new Error( "DefaultActionTypes class is static container only." );
		}

		/**
		 * Creates and returns a string representation of the DefaultActionTypes object.
		 */
		public function toString():String
		{
			return "[DefaultActionTypes]";
		}
	}
}