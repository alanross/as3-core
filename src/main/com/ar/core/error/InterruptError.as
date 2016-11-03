package com.ar.core.error
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class InterruptError extends Error
	{
		/**
		 * Creates a new instance of InterruptError.
		 */
		public function InterruptError( message:String = "", id:int = 0 )
		{
			super( message, id );
		}

		/**
		 * Creates and returns a string representation of the InterruptError object.
		 */
		public function toString():String
		{
			return "[InterruptError message:" + message + ", id:" + errorID + "]";
		}
	}
}
