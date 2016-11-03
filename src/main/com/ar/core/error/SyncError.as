package com.ar.core.error
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class SyncError extends Error
	{
		/**
		 * Creates a new instance of SyncError.
		 */
		public function SyncError( message:String = null, id:int = 0 )
		{
			super( message, id );
		}

		/**
		 * Creates and returns a string representation of the SyncError object.
		 */
		public function toString():String
		{
			return "[SyncError message:" + message + ", id:" + errorID + "]";
		}
	}
}
