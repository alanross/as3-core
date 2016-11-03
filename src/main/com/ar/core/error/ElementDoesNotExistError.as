package com.ar.core.error
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class ElementDoesNotExistError extends Error
	{
		/**
		 * Creates a new instance of ElementDoesNotExistError.
		 */
		public function ElementDoesNotExistError( message:String = null, id:int = 0 )
		{
			super( message, id );
		}

		/**
		 * Creates and returns a string representation of the ElementDoesNotExistError object.
		 */
		public function toString():String
		{
			return "[ElementDoesNotExistError message:" + message + ", id:" + errorID + "]";
		}
	}
}
