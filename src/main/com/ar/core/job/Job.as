package com.ar.core.job
{
	import com.ar.core.error.ElementAlreadyExistsError;
	import com.ar.core.error.ElementDoesNotExistError;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public class Job implements IJob
	{
		private var _observers:Vector.<IJobObserver>;

		private var _running:Boolean;

		/**
		 * Creates a new instance of Job.
		 */
		public function Job()
		{
			_observers = new Vector.<IJobObserver>();
		}

		/**
		 *
		 */
		protected function onStart():void
		{
			//override to handle starting of job in subclass
		}

		/**
		 *
		 */
		protected function onCancel():void
		{
			//override to handle cancellation of job in subclass
		}

		/**
		 *
		 */
		protected function onComplete():void
		{
			//override to handle job completion in subclass
		}

		/**
		 *
		 */
		protected function onFail():void
		{
			//override to handle job failure in subclass
		}

		/**
		 *
		 */
		public final function start():void
		{
			onStart();

			_running = true;
		}

		/**
		 *
		 */
		public final function cancel():void
		{
			onCancel();

			_running = false;

			dispatchJobCancelled( this );
		}

		/**
		 *
		 */
		public final function complete():void
		{
			onComplete();

			_running = false;

			dispatchJobCompleted( this );
		}

		/**
		 *
		 */
		public final function fail( error:Error ):void
		{
			onFail();

			_running = false;

			dispatchJobFailed( this, error );
		}

		/**
		 *
		 */
		public final function addObserver( observer:IJobObserver ):void
		{
			if( hasObserver( observer ) )
			{
				throw new ElementAlreadyExistsError();
			}

			_observers.unshift( observer );
		}

		/**
		 *
		 */
		public final function removeObserver( observer:IJobObserver ):void
		{
			if( !hasObserver( observer ) )
			{
				throw new ElementDoesNotExistError();
			}

			const index:int = _observers.indexOf( observer );

			_observers.splice( index, 1 );
		}

		/**
		 *
		 */
		public final function hasObserver( observer:IJobObserver ):Boolean
		{
			const index:int = _observers.indexOf( observer );

			return ( -1 != index );
		}

		/**
		 *
		 */
		protected final function dispatchJobCompleted( job:IJob ):void
		{
			var n:int = _observers.length;

			while( --n > -1 )
			{
				_observers[n].onJobCompleted( job );
			}
		}

		/**
		 *
		 */
		protected final function dispatchJobCancelled( job:IJob ):void
		{
			var n:int = _observers.length;

			while( --n > -1 )
			{
				_observers[n].onJobCancelled( job );
			}
		}

		/**
		 *
		 */
		protected final function dispatchJobFailed( job:IJob, error:Error ):void
		{
			var n:int = _observers.length;

			while( --n > -1 )
			{
				_observers[n].onJobFailed( job, error );
			}
		}

		/**
		 *
		 */
		protected final function dispatchJobProgress( job:IJob, progress:Number ):void
		{
			var n:int = _observers.length;

			while( --n > -1 )
			{
				_observers[n].onJobProgress( job, progress );
			}
		}

		/**
		 *
		 */
		public final function isRunning():Boolean
		{
			return _running;
		}

		/**
		 * Frees all internal references of the object.
		 */
		public function dispose():void
		{
			_observers.splice( 0, _observers.length );
			_observers = null;
		}

		/**
		 * Creates and returns a string representation of the Job object.
		 */
		public function toString():String
		{
			return "[Job]";
		}
	}
}