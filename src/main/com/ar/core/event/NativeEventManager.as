package com.ar.core.event
{
	import com.ar.core.error.NullError;
	import com.ar.core.error.SingletonError;

	import flash.display.Stage;
	import flash.events.Event;

	/**
	 * A collection of native events to which call back functions
	 * can easily be attached to.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class NativeEventManager
	{
		private static var _instance:NativeEventManager;

		public static const enterFrame:NativeEvent = new NativeEvent();
		public static const exitFrame:NativeEvent = new NativeEvent();
		public static const activate:NativeEvent = new NativeEvent();
		public static const deactivate:NativeEvent = new NativeEvent();
		public static const fullScreen:NativeEvent = new NativeEvent();
		public static const render:NativeEvent = new NativeEvent();
		public static const mouseLeave:NativeEvent = new NativeEvent();
		public static const resize:NativeEvent = new NativeEvent();

		/**
		 * Creates an instance of NativeEventManager and initializes it.
		 */
		public static function initialize( stage:Stage ):void
		{
			if( _instance != null )
			{
				throw new SingletonError( "NativeEventManager" );
			}

			if( null == stage )
			{
				throw new NullError();
			}

			_instance = new NativeEventManager( new Lock(), stage );
		}

		/**
		 * Enables all events to be dispatched
		 */
		public static function enable():void
		{
			enterFrame.enable();
			exitFrame.enable();

			activate.enable();
			deactivate.enable();

			fullScreen.enable();

			render.enable();

			mouseLeave.enable();

			resize.enable();
		}

		/**
		 * Prevents all events from being dispatched.
		 */
		public static function prevent():void
		{
			enterFrame.prevent();
			exitFrame.prevent();

			activate.prevent();
			deactivate.prevent();

			fullScreen.prevent();

			render.prevent();

			mouseLeave.prevent();

			resize.prevent();
		}

		/**
		 * Returns the single instance of NativeEventManager.
		 */
		public static function get():NativeEventManager
		{
			return _instance;
		}

		/**
		 * Creates a new instance of NativeEventManager.
		 */
		public function NativeEventManager( lock:Lock, stage:Stage )
		{
			enterFrame.initialize( stage, Event.ENTER_FRAME );
			exitFrame.initialize( stage, Event.EXIT_FRAME );

			activate.initialize( stage, Event.ACTIVATE );
			deactivate.initialize( stage, Event.DEACTIVATE );

			fullScreen.initialize( stage, Event.FULLSCREEN );

			render.initialize( stage, Event.RENDER );

			mouseLeave.initialize( stage, Event.MOUSE_LEAVE );

			resize.initialize( stage, Event.RESIZE );
		}

		/**
		 * Creates and returns a string representation of the NativeEventManager object.
		 */
		public function toString():String
		{
			return "[NativeEventManager]";
		}
	}
}

class Lock
{
}