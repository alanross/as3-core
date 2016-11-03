package com.ar.core.log
{
	/**
	 * Defines the level of the log messages.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class Level
	{
		// enumeration of default level types.

		public static const OFF:Level = new Level( "OFF", -1 );
		public static const TRACE:Level = new Level( "TRACE", 1 );
		public static const INFO:Level = new Level( "INFO", 2 );
		public static const WARN:Level = new Level( "WARN", 3 );
		public static const ERROR:Level = new Level( "ERROR", 4 );
		public static const FATAL:Level = new Level( "FATAL", 5 );

		private var _name:String;
		private var _priority:int;

		/**
		 * Creates a new instance of Level.
		 */
		public function Level( name:String, priority:int )
		{
			_name = name;
			_priority = priority;
		}

		/**
		 * Returns the name of the level.
		 */
		public function get name():String
		{
			return _name;
		}

		/**
		 * Returns the priority of the level.
		 */
		public function get priority():int
		{
			return _priority;
		}

		/**
		 * Creates and returns a string representation of the Level object.
		 */
		public function toString():String
		{
			return "[Level]";
		}
	}
}