package com.ar.core.log.output
{
	import com.ar.core.log.ContextInfo;
	import com.ar.core.log.ILogOutput;
	import com.ar.core.log.Level;

	/**
	 * Writes the output to the native trace function.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class TraceLogOutput implements ILogOutput
	{
		/**
		 * Creates a new instance of TraceLogOutput.
		 */
		public function TraceLogOutput()
		{
		}

		/**
		 * @inheritDoc
		 */
		public function write( level:Level, context:ContextInfo, message:String ):void
		{
			trace( "[" + level.name.toUpperCase() + " :: " + context.name.toUpperCase() + "]:", message );
		}

		/**
		 * @inheritDoc
		 */
		public function dispose():void
		{
		}

		/**
		 * Creates and returns a string representation of the TraceLogOutput object.
		 */
		public function toString():String
		{
			return "[TraceLogOutput]";
		}

	}
}