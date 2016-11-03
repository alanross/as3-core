package com.ar.core.notification.signals
{
	import com.ar.core.error.ElementAlreadyExistsError;
	import com.ar.core.error.ElementDoesNotExistError;
	import com.ar.core.error.SingletonError;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class Signals
	{
		private static var _instance:Signals;

		private static var __id:int = -1;

		private static const receivers:Vector.<ISignalReceiver> = new Vector.<ISignalReceiver>();
		private static const types:Vector.<int> = new Vector.<int>();

		/**
		 * Creates an instance of Signals and initializes it.
		 */
		public static function initialize():void
		{
			if( _instance != null )
			{
				throw new SingletonError( 'Signals' );
			}

			_instance = new Signals( new Lock() );
		}

		/**
		 * Create a new signal id.
		 */
		public static function createTypeID():int
		{
			__id++;

			if( hasSignalType( __id ) )
			{
				throw new ElementAlreadyExistsError();
			}

			types.unshift( __id );

			return __id;

		}

		/**
		 * Send signal to attached receivers.
		 */
		public static function send( signalType:int, signalSource:ISignalSource ):void
		{
			if( !hasSignalType( signalType ) )
			{
				throw new ElementAlreadyExistsError();
			}

			var n:int = receivers.length;

			while( --n > -1 )
			{
				receivers[n].onSignal( signalType, signalSource );
			}
		}

		/**
		 * Returns true of signal type is registered, false otherwise.
		 */
		public static function hasSignalType( type:int ):Boolean
		{
			return ( -1 != types.indexOf( type ) );
		}

		/**
		 * Add a receiver to be notified when a signal is sent.
		 */
		public static function addReceiver( receiver:ISignalReceiver ):void
		{
			if( hasReceiver( receiver ) )
			{
				throw new ElementAlreadyExistsError();
			}

			receivers.unshift( receiver );
		}

		/**
		 * Remove a receiver from being notified when a signal is sent.
		 */
		public static function removeReceiver( receiver:ISignalReceiver ):void
		{
			if( !hasReceiver( receiver ) )
			{
				throw new ElementDoesNotExistError();
			}

			receivers.splice( receivers.indexOf( receiver ), 1 );
		}

		/**
		 * Returns true if given receiver is part of the list.
		 */
		public static function hasReceiver( receiver:ISignalReceiver ):Boolean
		{
			return ( -1 != receivers.indexOf( receiver ) );
		}

		/**
		 * Creates a new instance of Signals.
		 */
		public function Signals( lock:Lock )
		{

		}

		/**
		 * Creates and returns a string representation of the Signals object.
		 */
		public function toString():String
		{
			return "[Signals]";
		}
	}
}

class Lock
{
}