package com.ar.core.error
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class SingletonError extends Error
	{
		/**
		 * Creates a new instance of SingletonError.
		 */
		public function SingletonError( singletonClassName:String = null, id:int = 0 )
		{
			var msg:String;

			if( singletonClassName != null )
			{
				msg = "Singleton'" + singletonClassName + "' is already initialized.";
			}
			else
			{
				msg = "Singleton is already initialized.";
			}

			super( msg, id );
		}

		/**
		 * Creates and returns a string representation of the SingletonError object.
		 */
		public function toString():String
		{
			return "[SingletonError message:" + message + ", id:" + errorID + "]";
		}
	}
}
