package com.ar.core.log
{
	import com.ar.core.error.NullError;
	import com.ar.core.error.SingletonError;
	import com.ar.core.utils.IDisposable;

	import flash.utils.getTimer;

	/**
	 * Provides functions to write messages to an output medium.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class Log implements IDisposable
	{
		private static var _instance:Log;

		private static var _outputs:Vector.<ILogOutput>;

		private static var _timeStart:Number;

		/**
		 * Creates an instance of Log and initializes it.
		 */
		public static function initialize():void
		{
			if( _instance != null )
			{
				throw new SingletonError( "Log" );
			}

			_instance = new Log( new Lock() );
		}

		/**
		 * Returns the single instance of Log.
		 */
		public static function get():Log
		{
			return _instance;
		}

		/**
		 * Write a trace message to the log.
		 */
		public static function trace( category:ContextInfo, ...params ):void
		{
			if( _instance == null )
			{
				throw new NullError( "Log trace: instance is null" );
			}

			if( category.permitOutput( Level.TRACE ) )
			{
				const message:String = "" + params.join( " " );

				_instance.write( Level.TRACE, category, message );
			}
		}

		/**
		 * Write an info message to the log.
		 */
		public static function info( category:ContextInfo, ...params ):void
		{
			if( _instance == null )
			{
				throw new NullError( "Log info: instance is null" );
			}

			if( category.permitOutput( Level.INFO ) )
			{
				const message:String = "" + params.join( " " );

				_instance.write( Level.INFO, category, message );
			}
		}

		/**
		 * Write a warning message to the log.
		 */
		public static function warn( category:ContextInfo, ...params ):void
		{
			if( _instance == null )
			{
				throw new NullError( "Log warn: instance is null" );
			}

			if( category.permitOutput( Level.WARN ) )
			{
				const message:String = "" + params.join( " " );

				_instance.write( Level.WARN, category, message );
			}
		}

		/**
		 * Write an error message to the log.
		 */
		public static function error( category:ContextInfo, ...params ):void
		{
			if( _instance == null )
			{
				throw new NullError( "Log error: instance is null" );
			}

			if( category.permitOutput( Level.ERROR ) )
			{
				const message:String = "" + params.join( " " );

				_instance.write( Level.ERROR, category, message );
			}
		}

		/**
		 * Write an fatal error message to the log.
		 */
		public static function fatal( category:ContextInfo, ...params ):void
		{
			if( _instance == null )
			{
				throw new NullError( "Log fatal: instance is null" );
			}

			if( category.permitOutput( Level.FATAL ) )
			{
				const message:String = "" + params.join( " " );

				_instance.write( Level.FATAL, category, message );
			}
		}

		public static function timeStart():void
		{
			_timeStart = getTimer();
		}

		public static function timeEnd( msg:String = null ):void
		{
			var delta:Number = getTimer() - _timeStart;

			if( msg )
			{
				Log.info( Context.TIME, msg + " : " + delta + "ms" );
			}
			else
			{
				Log.info( Context.TIME, delta + "ms" );
			}
		}

		/**
		 * Creates a new instance of Log.
		 */
		public function Log( lock:Lock )
		{
			_outputs = new Vector.<ILogOutput>();
		}

		/**
		 * Add an output for the log message to be written to.
		 */
		public function addOutput( output:ILogOutput ):void
		{
			if( !hasOutput( output ) )
			{
				_outputs.push( output );
			}
		}

		/**
		 * Remove given output from the log.
		 */
		public function removeOutput( output:ILogOutput ):void
		{
			if( hasOutput( output ) )
			{
				_outputs.splice( _outputs.indexOf( output ), 1 );
			}
		}

		/**
		 * Returns true, if the log has given output, false otherwise.
		 */
		public function hasOutput( output:ILogOutput ):Boolean
		{
			const index:int = _outputs.indexOf( output );

			return ( -1 != index );
		}

		/**
		 * Frees all internal references of the object.
		 */
		public function dispose():void
		{
			_outputs.splice( 0, _outputs.length );
			_outputs = null;
		}

		/**
		 * Direct the log message to attached output medium.
		 */
		private function write( level:Level, context:ContextInfo, message:String ):void
		{
			var n:int = _outputs.length;

			while( --n > -1 )
			{
				_outputs[n].write( level, context, message );
			}
		}

		/**
		 * Creates and returns a string representation of the Log object.
		 */
		public function toString():String
		{
			return "[Log]";
		}
	}
}

class Lock
{
}