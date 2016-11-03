package com.ar.core.error
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class MissingImplementationError extends Error
	{
		/**
		 * Creates a new instance of MissingImplementationError.
		 */
		public function MissingImplementationError( message:String = null, id:int = 0 )
		{
			super( message, id );
		}

		/**
		 * Creates and returns a string representation of the MissingImplementationError object.
		 */
		public function toString():String
		{
			return "[MissingImplementationError message:" + message + ", id:" + errorID + "]";
		}
	}
}
