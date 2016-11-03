package com.ar.core.error
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class ElementAlreadyExistsError extends Error
	{
		/**
		 * Creates a new instance of ElementAlreadyExistsError.
		 */
		public function ElementAlreadyExistsError( message:String = null, id:int = 0 )
		{
			super( message, id );
		}

		/**
		 * Creates and returns a string representation of the ElementAlreadyExistsError object.
		 */
		public function toString():String
		{
			return "[ElementAlreadyExistsError message:" + message + ", id:" + errorID + "]";
		}
	}
}
