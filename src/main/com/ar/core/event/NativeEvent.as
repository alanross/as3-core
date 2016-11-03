package com.ar.core.event
{
	import flash.display.Stage;
	import flash.events.Event;

	/**
	 * A a simple version of a native event to which observers can be added to.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class NativeEvent
	{
		private var _observers:Vector.<Function>;
		private var _observerCount:int;
		private var _enabled:Boolean = true;

		/**
		 * Creates a new instance of NativeEvent.
		 */
		public function NativeEvent()
		{
			_observers = new Vector.<Function>();
			_observerCount = 0;
		}

		/**
		 *
		 */
		internal function initialize( stage:Stage, eventType:String ):void
		{
			stage.addEventListener( eventType, processEvent );
		}

		/**
		 *
		 */
		private function processEvent( event:Event ):void
		{
			event.stopPropagation();

			if( _enabled )
			{
				invoke();
			}
		}

		/**
		 *
		 */
		private function invoke():void
		{
			var n:int = _observerCount;

			while( --n > -1 )
			{
				// calls the function acting as a callback
				_observers[n]();
			}
		}

		/**
		 *
		 */
		public function add( f:Function ):void
		{
			if( !has( f ) )
			{
				_observers.unshift( f );
				_observerCount++;
			}
		}

		/**
		 *
		 */
		public function remove( f:Function ):void
		{
			if( has( f ) )
			{
				_observers.splice( _observers.indexOf( f ), 1 );
				_observerCount--;
			}
		}

		/**
		 *
		 */
		public function has( f:Function ):Boolean
		{
			const index:int = _observers.indexOf( f );

			return ( -1 != index );
		}

		/**
		 *
		 */
		internal function enable():void
		{
			_enabled = true;
		}

		/**
		 *
		 */
		internal function prevent():void
		{
			_enabled = false;
		}

		/**
		 * Creates and returns a string representation of the NativeEvent object.
		 */
		public function toString():String
		{
			return "[NativeEvent]";
		}
	}
}