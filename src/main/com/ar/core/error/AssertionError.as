package com.ar.core.error
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class AssertionError extends Error
	{
		/**
		 * Creates a new instance of AssertionError.
		 */
		public function AssertionError( message:String = null, id:int = 0 )
		{
			super( message, id );
		}

		/**
		 * Creates and returns a string representation of the AssertionError object.
		 */
		public function toString():String
		{
			return "[AssertionError message:" + message + ", id:" + errorID + "]";
		}
	}
}
