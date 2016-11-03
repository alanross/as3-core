package com.ar.core.error
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class AbstractFunctionError extends Error
	{
		/**
		 * Creates a new instance of AbstractFunctionError.
		 */
		public function AbstractFunctionError( functionName:String = null, id:int = 0 )
		{
			var msg:String;

			if( functionName != null )
			{
				msg = "Function'" + functionName + "' is declared abstract";
			}
			else
			{
				msg = "Function is declared abstract";
			}

			super( msg, id );
		}

		/**
		 * Creates and returns a string representation of the AbstractFunctionError object.
		 */
		public function toString():String
		{
			return "[AbstractFunctionError message:" + message + ", id:" + errorID + "]";
		}
	}
}
