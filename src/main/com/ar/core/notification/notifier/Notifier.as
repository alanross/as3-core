package com.ar.core.notification.notifier
{
	import com.ar.core.error.ElementAlreadyExistsError;
	import com.ar.core.error.ElementDoesNotExistError;
	import com.ar.core.error.NullError;
	import com.ar.core.utils.IDisposable;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class Notifier implements IDisposable
	{
		private var _observers:Vector.<INotifierObserver>;
		private var _observerCount:int = 0;

		/**
		 * Creates a new instance of Notifier.
		 */
		public function Notifier()
		{
		}

		/**
		 * Add the given observer to the list of observers.
		 */
		public function add( observer:INotifierObserver ):INotifierObserver
		{
			if( null == _observers )
			{
				_observers = new Vector.<INotifierObserver>();
				_observerCount = 0;
			}

			if( null == observer )
			{
				throw new NullError( "observer can not be null" );
			}

			if( -1 != _observers.indexOf( observer ) )
			{
				throw new ElementAlreadyExistsError( observer + " already exists" );
			}

			_observers.unshift( observer );
			_observerCount++;

			return observer;
		}

		/**
		 * Remove the given observer from the list of observers.
		 */
		public function remove( observer:INotifierObserver ):INotifierObserver
		{
			if( null == observer )
			{
				throw new NullError( "observer can not be null" );
			}

			if( null == _observers )
			{
				throw new ElementDoesNotExistError( observer + " does not exist" );
			}

			const index:int = _observers.indexOf( observer );

			if( -1 == index )
			{
				throw new ElementDoesNotExistError( observer + " does not exist" );
			}

			_observers.splice( index, 1 );
			_observerCount--;

			return observer;
		}

		/**
		 * Returns true if the given observer is part of the list of observers, false otherwise.
		 */
		public function has( observer:INotifierObserver ):Boolean
		{
			if( null == observer )
			{
				throw new NullError( "observer can not be null" );
			}

			if( null == _observers )
			{
				return false;
			}

			const index:int = _observers.indexOf( observer );

			return ( -1 != index );
		}

		/**
		 * Dispatch the event.
		 */
		public function dispatch( event:INotifierEvent, resetEventAfterDispatch:Boolean = true ):void
		{
			// !important:
			// the number of the observers is subject to change while
			// iterating through the list.

			if( _observers != null )
			{
				var n:int = _observerCount;

				while( --n > -1 )
				{
					_observers[ n ].onNotifierEvent( event );
				}
			}

			if( resetEventAfterDispatch )
			{
				event.reset();
			}
		}

		/**
		 * Clear the list of observers. This empties the list.
		 */
		public function clear():void
		{
			_observers.splice( 0, _observers.length );
			_observerCount = 0;
		}

		/**
		 * Frees all internal references of the object.
		 */
		public function dispose():void
		{
			clear();

			_observers = null;
		}

		/**
		 * Returns the number of observers in the list.
		 */
		public function get numObservers():int
		{
			return _observerCount;
		}

		/**
		 * Return the list of observers to be notified on changes
		 */
		public function get observers():Vector.<INotifierObserver>
		{
			return _observers;
		}

		/**
		 * Creates and returns a string representation of the Notifier object.
		 */
		public function toString():String
		{
			return "[Notifier]";
		}
	}
}