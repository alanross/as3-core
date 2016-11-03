package com.ar.core.error
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class NullError extends Error
	{
		/**
		 * Creates a new instance of NullError.
		 */
		public function NullError( message:String = null, id:int = 0 )
		{
			super( message, id );
		}

		/**
		 * Creates and returns a string representation of the NullError object.
		 */
		public function toString():String
		{
			return "[NullError message:" + message + ", id:" + errorID + "]";
		}
	}
}
