package com.ar.core.log
{
	import com.ar.core.utils.IDisposable;

	/**
	 * Used as output medium for log messages.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public interface ILogOutput extends IDisposable
	{
		/**
		 * Called when message is written to log
		 */
		function write( level:Level, context:ContextInfo, message:String ):void;
	}
}