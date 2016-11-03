package com.ar.core.error
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class IllegalStateError extends Error
	{
		/**
		 * Creates a new instance of IllegalStateError.
		 */
		public function IllegalStateError( message:String = "", id:int = 0 )
		{
			super( message, id );
		}

		/**
		 * Creates and returns a string representation of the IllegalStateError object.
		 */
		public function toString():String
		{
			return "[IllegalStateError message:" + message + ", id:" + errorID + "]";
		}
	}
}
