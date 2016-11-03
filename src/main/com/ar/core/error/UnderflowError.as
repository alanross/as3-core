package com.ar.core.error
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class UnderflowError extends Error
	{
		/**
		 * Creates a new instance of UnderflowError.
		 */
		public function UnderflowError( message:String = null, id:int = 0 )
		{
			super( message, id );
		}

		/**
		 * Creates and returns a string representation of the UnderflowError object.
		 */
		public function toString():String
		{
			return "[UnderflowError message:" + message + ", id:" + errorID + "]";
		}
	}
}
