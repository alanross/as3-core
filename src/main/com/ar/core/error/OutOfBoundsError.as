package com.ar.core.error
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class OutOfBoundsError extends Error
	{
		/**
		 * Creates a new instance of OutOfBoundsError.
		 */
		public function OutOfBoundsError( value:Number, min:Number, max:Number, id:int = 0 )
		{
			var msg:String;

			if( value < min )
			{
				msg = "Out of bounds: value:" + value + " is smaller than " + min;
			}
			else if( value >= max )
			{
				msg = "Out of bounds: value:" + value + " is larger than or equal " + max;
			}

			super( msg, id );
		}

		/**
		 * Creates and returns a string representation of the OutOfBoundsError object.
		 */
		public function toString():String
		{
			return "[OutOfBoundsError message:" + message + ", id:" + errorID + "]";
		}
	}
}
