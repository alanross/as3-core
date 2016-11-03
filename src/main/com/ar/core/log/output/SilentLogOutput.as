package com.ar.core.log.output
{
	import com.ar.core.log.ContextInfo;
	import com.ar.core.log.ILogOutput;
	import com.ar.core.log.Level;

	/**
	 * Only records the log output.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class SilentLogOutput implements ILogOutput
	{
		private var _record:Vector.<String>;

		/**
		 * Creates a new instance of SilentLogOutput.
		 */
		public function SilentLogOutput()
		{
			_record = new Vector.<String>();
		}

		/**
		 * @inheritDoc
		 */
		public function write( level:Level, context:ContextInfo, message:String ):void
		{
			_record.push( ( "[" + level.name.toUpperCase() + " :: " + context.name.toUpperCase() + "]: " + message ) );
		}

		/**
		 * Create and return a string containing all log messages.
		 */
		public function dump( entrySeparator:String = "\n" ):String
		{
			return _record.join( entrySeparator );
		}

		/**
		 * @inheritDoc
		 */
		public function dispose():void
		{
			_record = null;
		}

		/**
		 * Creates and returns a string representation of the SilentLogOutput object.
		 */
		public function toString():String
		{
			return "[SilentLogOutput]";
		}
	}
}