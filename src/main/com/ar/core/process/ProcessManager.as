package com.ar.core.process
{
	import com.ar.core.error.ElementAlreadyExistsError;
	import com.ar.core.error.ElementDoesNotExistError;
	import com.ar.core.error.SingletonError;
	import com.ar.core.event.NativeEventManager;

	/**
	 * A simplified version of pseudo threads/workers.
	 * Each added process only receives a certain amount of
	 * processing priority each frame.
	 *
	 * It is required that NativeEventManager is already initialized
	 * when using the ProcessManager.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class ProcessManager
	{
		private static var _instance:ProcessManager;

		private var _list:Vector.<IProcess> = null;
		private var _processListCount:int = 0;

		private var _processIndex:int = 0;

		private var _process:IProcess = null;

		private var _processTickCount:int = 0;

		private var _capacity:int;

		/**
		 * Creates an instance of ProcessManager and initializes it.
		 */
		public static function initialize( defaultCapacity:int = 10 ):void
		{
			if( _instance != null )
			{
				throw new SingletonError( "ProcessManager" );
			}

			_instance = new ProcessManager( new Lock(), defaultCapacity );
		}

		/**
		 * Returns the single instance of ProcessManager.
		 */
		public static function get():ProcessManager
		{
			return _instance;
		}

		/**
		 *
		 */
		public static function start( process:IProcess ):void
		{
			_instance.addProcess( process );
		}

		/**
		 *
		 */
		public static function stop( process:IProcess ):void
		{
			_instance.removeProcess( process );
		}

		/**
		 *
		 */
		public static function isRunning( process:IProcess ):Boolean
		{
			return _instance.hasProcess( process );
		}

		/**
		 * Creates a new instance of ProcessManager.
		 */
		public function ProcessManager( lock:Lock, defaultCapacity:int )
		{
			_list = new Vector.<IProcess>();
			_capacity = defaultCapacity;
		}

		/**
		 *
		 */
		private function waken():void
		{
			NativeEventManager.enterFrame.add( run );
		}

		/**
		 *
		 */
		private function sleep():void
		{
			NativeEventManager.enterFrame.remove( run );
		}

		/**
		 *
		 */
		private function getNextProcess():IProcess
		{
			// decrement to keep order in which the processes were added
			// while iterating. A processes is added to the array with unshift.
			// (as it can be removed while processing)
			if( 0 > --_processIndex )
			{
				_processIndex = _processListCount - 1;
			}

			return _list[ _processIndex ];
		}

		/**
		 *
		 */
		private function run():void
		{
			var n:int = _capacity;

			while( --n > -1 )
			{
				// process array could have been emptied while
				// process-loop or a new enter frame com.com.adjazent.events.event.
				if( _processListCount == 0 )
				{
					sleep();
					return;
				}

				if( null == _process )
				{
					_process = getNextProcess();
					_processTickCount = _process.getProcessPriority();
				}

				_process.onProcessRun();

				// active process was removed
				if( null == _process )
				{
					continue;
				}

				// decrement amount of ticks left in cycle before next
				// process is activated
				if( 0 == --_processTickCount )
				{
					_process = null;
				}
			}
		}

		/**
		 *
		 */
		private function addProcess( process:IProcess ):void
		{
			if( hasProcess( process ) )
			{
				throw new ElementAlreadyExistsError();
			}

			_list.unshift( process );
			_processListCount++;

			process.onProcessStart();

			if( _processListCount == 1 )
			{
				waken();
			}
		}

		/**
		 *
		 */
		private function removeProcess( process:IProcess ):void
		{
			if( !hasProcess( process ) )
			{
				throw new ElementDoesNotExistError();
			}

			_list.splice( _list.indexOf( process ), 1 );
			_processListCount--;

			if( process == _process )
			{
				_process = null;
			}

			if( _processListCount == 0 )
			{
				sleep();
			}

			process.onProcessStop();
		}

		/**
		 *
		 */
		private function hasProcess( process:IProcess ):Boolean
		{
			const index:int = _list.indexOf( process );

			return ( -1 != index );
		}

		/**
		 * Creates and returns a string representation of the ProcessManager object.
		 */
		public function toString():String
		{
			return "[ProcessManager]";
		}
	}
}

class Lock
{
}