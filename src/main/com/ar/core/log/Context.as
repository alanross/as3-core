package com.ar.core.log
{
	/**
	 * The context of the message when sent to log.
	 * Helps to separate different messages and give them different priorities.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class Context
	{
		public static const DEFAULT:ContextInfo = new ContextInfo( "DEFAULT", Level.INFO, Level.FATAL );
		public static const UI:ContextInfo = new ContextInfo( "UI", Level.INFO, Level.FATAL );
		public static const NET:ContextInfo = new ContextInfo( "NET", Level.INFO, Level.FATAL );
		public static const TIME:ContextInfo = new ContextInfo( "TIME", Level.INFO, Level.FATAL );

		/**
		 * Set the min and max level of logging for given context.
		 */
		public static function setLevels( context:ContextInfo, minLevel:Level, maxLevel:Level ):void
		{
			context.minLevel = minLevel;
			context.maxLevel = maxLevel;
		}

		/**
		 * Creates and returns a string representation of the Context object.
		 */
		public function toString():String
		{
			return "[Context]";
		}
	}
}