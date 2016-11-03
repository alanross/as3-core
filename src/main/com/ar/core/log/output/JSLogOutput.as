package com.ar.core.log.output
{
	import com.ar.core.log.ContextInfo;
	import com.ar.core.log.ILogOutput;
	import com.ar.core.log.Level;

	import flash.external.ExternalInterface;

	/**
	 * Write to the console of a browser by utilizing the external interface.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class JSLogOutput implements ILogOutput
	{
		private var _available:Boolean = true;

		/**
		 * Creates a new instance of JSLogOutput.
		 */
		public function JSLogOutput()
		{
		}

		/**
		 * @inheritDoc
		 */
		public function write( level:Level, context:ContextInfo, message:String ):void
		{
			if( ExternalInterface.available )
			{
				message = ( "[" + level.name.toUpperCase() + " :: " + context.name.toUpperCase() + "]: " + message );

				ExternalInterface.call( "console.log", message );
			}
			else
			{
				if( _available )
				{
					_available = false;

					trace( "ExternalInterface not available. Ignoring subsequent input." );
				}
			}
		}

		/**
		 * @inheritDoc
		 */
		public function dispose():void
		{
		}

		/**
		 * Creates and returns a string representation of the JSLogOutput object.
		 */
		public function toString():String
		{
			return "[JSLogOutput]";
		}
	}
}