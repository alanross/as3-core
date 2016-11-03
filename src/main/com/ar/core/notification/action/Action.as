package com.ar.core.notification.action
{
	import com.ar.core.error.ElementAlreadyExistsError;
	import com.ar.core.error.ElementDoesNotExistError;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public class Action
	{
		private var _type:String;

		private var _origin:Object;

		private var _observer:Vector.<IActionObserver>;

		/**
		 * Creates a new instance of Action.
		 */
		public function Action( type:String )
		{
			_type = type;

			_observer = new Vector.<IActionObserver>();
		}

		/**
		 *
		 */
		public function add( observer:IActionObserver ):void
		{
			if( has( observer ) )
			{
				throw new ElementAlreadyExistsError();
			}

			_observer.unshift( observer );
		}

		/**
		 *
		 */
		public function remove( observer:IActionObserver ):void
		{
			if( !has( observer ) )
			{
				throw new ElementDoesNotExistError();
			}

			const index:int = _observer.indexOf( observer );

			_observer.splice( index, 1 );
		}

		/**
		 *
		 */
		public function has( observer:IActionObserver ):Boolean
		{
			return ( -1 != _observer.indexOf( observer ) );
		}

		/**
		 *
		 */
		public function send( origin:Object ):void
		{
			_origin = origin;

			var n:int = _observer.length;

			while( --n > -1 )
			{
				_observer[n].onActionEvent( this );
			}
		}

		/**
		 * Frees all internal references of the object.
		 */
		public function dispose():void
		{
			_observer.splice( 0, _observer.length );
			_observer = null;

			_type = null;
			_origin = null;
		}

		/**
		 *
		 */
		public function get type():String
		{
			return _type;
		}

		/**
		 *
		 */
		public function get origin():Object
		{
			return _origin;
		}

		/**
		 * Creates and returns a string representation of the Action object.
		 */
		public function toString():String
		{
			return "[Action type: " + _type + "]";
		}
	}
}