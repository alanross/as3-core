package com.ar.core.job
{
	import com.ar.core.error.ElementAlreadyExistsError;
	import com.ar.core.error.ElementDoesNotExistError;
	import com.ar.core.error.OutOfBoundsError;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class JobQueue extends Job implements IJobObserver
	{
		private var _jobs:Vector.<IJob>;

		private var _active:IJob;

		private var _index:int;

		/**
		 * Creates a new instance of JobQueue.
		 */
		public function JobQueue()
		{
			_jobs = new Vector.<IJob>();
			_index = -1;
			_active = null;
		}

		/**
		 *
		 */
		private function process():void
		{
			if( ++_index < _jobs.length )
			{
				_active = _jobs[_index];
				_active.addObserver( this );
				_active.start();
			}
			else
			{
				complete();
			}
		}

		override protected function onStart():void
		{
			if( isRunning() )
			{
				throw new Error( "Can't start JobQueue, it is already running." );
			}

			_index = -1;

			process();
		}

		override protected function onCancel():void
		{
			if( !isRunning() )
			{
				throw new Error( "Can't cancel JobQueue, it is not running." );
			}

			// One can either cancel the JobQueue oder cancel a Job directly.
			// If a job was cancelled active will be null;
			if( _active != null )
			{
				_active.removeObserver( this );
				_active.cancel();
			}
		}

		/**
		 * Frees all internal references of the object.
		 */
		override public function dispose():void
		{
			super.dispose();

			_jobs.splice( 0, _jobs.length );
			_jobs = null;
		}

		/**
		 *
		 */
		public function addJob( job:IJob ):JobQueue
		{
			if( isRunning() )
			{
				throw new Error( "Can not add Job while JobQueue is running." );
			}

			if( hasJob( job ) )
			{
				throw new ElementAlreadyExistsError();
			}

			_jobs.push( job );

			return this;
		}

		/**
		 *
		 */
		public function removeJob( job:IJob ):JobQueue
		{
			if( isRunning() )
			{
				throw new Error( "Can not remove Job while JobQueue is running." );
			}

			if( !hasJob( job ) )
			{
				throw new ElementDoesNotExistError();
			}

			const index:int = _jobs.indexOf( job );

			_jobs.splice( index, 1 );

			return this;
		}

		/**
		 *
		 */
		public function removeJobs():void
		{
			var n:int = _jobs.length;

			while( --n > -1 )
			{
				removeJob( _jobs[n] );
			}
		}

		/**
		 *
		 */
		public function getJobAt( index:int ):IJob
		{
			if( index < 0 || index >= _jobs.length || _jobs.length == 0 )
			{
				throw new OutOfBoundsError( index, 0, _jobs.length );
			}

			return _jobs[index];
		}

		/**
		 *
		 */
		public function hasJob( job:IJob ):Boolean
		{
			const index:int = _jobs.indexOf( job );

			return ( -1 != index );
		}

		/**
		 *
		 */
		public function numJobs():int
		{
			return _jobs.length;
		}

		/**
		 *
		 */
		public function onJobProgress( job:IJob, progress:Number ):void
		{
			dispatchJobProgress( this, ( _index + progress ) / _jobs.length );
		}

		/**
		 *
		 */
		public function onJobCompleted( job:IJob ):void
		{
			_active.removeObserver( this );
			_active = null;

			dispatchJobProgress( this, ( _index + 1.0 ) / _jobs.length );

			process();
		}

		/**
		 *
		 */
		public function onJobCancelled( job:IJob ):void
		{
			_active.removeObserver( this );
			_active = null;

			cancel();
		}

		/**
		 *
		 */
		public function onJobFailed( job:IJob, error:Error ):void
		{
			_active.removeObserver( this );
			_active = null;

			fail( error );
		}

		/**
		 * Creates and returns a string representation of the JobQueue object.
		 */
		override public function toString():String
		{
			return "[JobQueue]";
		}
	}
}