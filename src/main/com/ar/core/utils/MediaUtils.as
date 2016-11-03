package com.ar.core.utils
{
	import flash.events.StatusEvent;
	import flash.events.TimerEvent;
	import flash.media.Camera;
	import flash.media.Microphone;
	import flash.media.Video;
	import flash.system.Security;
	import flash.system.SecurityPanel;
	import flash.utils.Timer;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class MediaUtils
	{
		/**
		 * Returns a new camera object or an error message using the call back functions.
		 * onSuccess( camera: Camera )
		 * onFailure( error: String )
		 */
		public static function getCamera( video:Video, onSuccess:Function, onFailure:Function ):void
		{
			if( Camera.names.length == 0 )
			{
				onFailure( "No camera found." );
				return;
			}

			if( !Camera.isSupported )
			{
				onFailure( "Camera not supported on this device." );
				return;
			}

			var cam:Camera = Camera.getCamera();

			if( cam == null )
			{
				onFailure( "No camera found." );
				return;
			}

			if( cam.muted )
			{
				var f:Function;

				cam.addEventListener( StatusEvent.STATUS, f = function ( event:StatusEvent ):void
				{
					cam.removeEventListener( StatusEvent.STATUS, f );

					if( !cam.muted )
					{
						attach( video, cam, onSuccess, onFailure );
					}
					else
					{
						onFailure( "Camera access denied." );
					}
				} );

				Security.showSettings( SecurityPanel.PRIVACY );
			}
			else
			{
				attach( video, cam, onSuccess, onFailure );
			}
		}

		private static function attach( video:Video, camera:Camera, onSuccess:Function, onFailure:Function ):void
		{
			video.attachCamera( camera );

			var t:Timer = new Timer( 100 );
			t.addEventListener( TimerEvent.TIMER, timerHandler );
			t.addEventListener( TimerEvent.TIMER_COMPLETE, timerCompleteHandler );
			t.start();

			function timerHandler( event:TimerEvent ):void
			{
				if( camera.activityLevel > 0 || camera.currentFPS > 0 )
				{
					t.reset();
					t.stop();
					t.removeEventListener( TimerEvent.TIMER, timerHandler );
					t.removeEventListener( TimerEvent.TIMER_COMPLETE, timerCompleteHandler );

					onSuccess( camera );
				}
			}

			function timerCompleteHandler( event:TimerEvent ):void
			{
				t.reset();
				t.stop();
				t.removeEventListener( TimerEvent.TIMER, timerHandler );
				t.removeEventListener( TimerEvent.TIMER_COMPLETE, timerCompleteHandler );

				onFailure( "Camera found, but not working" );
			}
		}

		/**
		 * Returns a new microphone object or an error message using the call back functions.
		 * onSuccess( microphone: Microphone )
		 * onFailure( error: String )
		 */
		public static function getMicrophone( onSuccess:Function, onFailure:Function ):void
		{
			if( Microphone.names.length == 0 )
			{
				onFailure( "No microphone found." );
				return;
			}

			if( !Microphone.isSupported )
			{
				onFailure( "Microphone not supported on this device." );
				return;
			}

			var mic:Microphone = Microphone.getMicrophone();

			if( mic == null )
			{
				onFailure( "No microphone found." );
				return;
			}

			if( mic.muted )
			{
				var f:Function;

				mic.addEventListener( StatusEvent.STATUS, f = function ( event:StatusEvent ):void
				{
					mic.removeEventListener( StatusEvent.STATUS, f );

					if( !mic.muted )
					{
						onSuccess( mic );
					}
					else
					{
						onFailure( "Microphone access denied." );
					}
				} );

				Security.showSettings( SecurityPanel.PRIVACY );
			}
			else
			{
				onSuccess( mic );
			}
		}

		/**
		 * Creates a new instance of MediaUtils.
		 */
		public function MediaUtils()
		{
			throw new Error( "MediaUtils class is static container only." );
		}

		/**
		 * Creates and returns a string representation of the MediaUtils object.
		 */
		public function toString():String
		{
			return "[MediaUtils]";
		}
	}
}