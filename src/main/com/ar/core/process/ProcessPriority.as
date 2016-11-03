package com.ar.core.process
{
	/**
	 * Enumeration of priority types used to define the priority level of a process.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class ProcessPriority
	{
		public static const LOW:int = 1;
		public static const MEDIUM:int = 8;
		public static const HIGH:int = 16;

		/**
		 * ProcessPriority class is static container only.
		 */
		public function ProcessPriority()
		{
			throw new Error( "ProcessPriority class is static container only" );
		}
	}
}