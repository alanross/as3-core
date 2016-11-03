package com.ar.core.log
{
	/**
	 * Defines the level range of a context.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class ContextInfo
	{
		public var minLevel:Level;
		public var maxLevel:Level;

		private var _name:String;

		/**
		 * Creates a new instance of ContextInfo.
		 */
		public function ContextInfo( name:String, minLevel:Level, maxLevel:Level )
		{
			if( minLevel.priority >= maxLevel.priority )
			{
				throw new ArgumentError( "minLevel can not be greater or equal maxLevel" );
			}

			_name = name;

			this.minLevel = minLevel;
			this.maxLevel = maxLevel;
		}

		/**
		 * Returns true if provided level is in range of permitted output, false otherwise.
		 */
		public function permitOutput( level:Level ):Boolean
		{
			const priority:int = level.priority;

			return !(priority == -1 || priority < minLevel.priority || priority > maxLevel.priority);
		}

		/**
		 * Returns the name property of the ContextInfo.
		 */
		public function get name():String
		{
			return _name;
		}

		/**
		 * Creates and returns a string representation of the ContextInfo object.
		 */
		public function toString():String
		{
			return "[ContextInfo]";
		}
	}
}