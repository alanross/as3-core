package com.ar.core.error
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class UnsupportedOperationError extends Error
	{
		/**
		 * Creates a new instance of UnsupportedOperationError.
		 */
		public function UnsupportedOperationError( message:String = null, id:int = 0 )
		{
			super( message, id );
		}

		/**
		 * Creates and returns a string representation of the UnsupportedOperationError object.
		 */
		public function toString():String
		{
			return "[UnsupportedOperationError message:" + message + ", id:" + errorID + "]";
		}
	}
}
