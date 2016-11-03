package com.ar.core.notification
{
	import com.ar.core.notification.signals.Signals;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class DefaultSignalTypes
	{
		public static const DEFAULT_TYPE:int = Signals.createTypeID();

		/**
		 * Creates a new instance of DefaultSignalTypes.
		 */
		public function DefaultSignalTypes()
		{
			throw new Error( "DefaultSignalTypes class is static container only." );
		}

		/**
		 * Creates and returns a string representation of the DefaultSignalTypes object.
		 */
		public function toString():String
		{
			return "[DefaultSignalTypes]";
		}
	}
}