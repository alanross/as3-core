package com.ar.core.error
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class ValueError extends Error
	{
		/**
		 * Creates a new instance of ValueError.
		 */
		public function ValueError( message:String = null, id:int = 0 )
		{
			super( message, id );
		}

		/**
		 * Creates and returns a string representation of the ValueError object.
		 */
		public function toString():String
		{
			return "[ValueError message:" + message + ", id:" + errorID + "]";
		}
	}
}
