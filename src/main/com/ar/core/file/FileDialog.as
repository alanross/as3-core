package com.ar.core.file
{
	import com.ar.core.log.Context;
	import com.ar.core.log.Log;

	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.FileReference;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public class FileDialog
	{
		private var _fileReference:FileReference;
		private var _observer:IFileDialogObserver;
		private var _progress:Number = 0.0;
		private var _id:int = -1;

		/**
		 * Creates a new instance of FileDialog.
		 */
		public function FileDialog()
		{
		}

		/**
		 * Handle called when file dialog is initiated.
		 */
		protected function onInitiate( fileReference:FileReference ):void
		{
		}

		/**
		 * Handle called when a file was selected by the user.
		 */
		protected function onSelected( fileReference:FileReference ):void
		{
		}

		/**
		 * Handle called when the file dialog is to be clean up and closed.
		 */
		protected function onExpire( fileReference:FileReference ):void
		{
		}

		/**
		 * Initiate the file dialog.
		 */
		protected final function initiate( observer:IFileDialogObserver ):void
		{
			if( _fileReference != null )
			{
				Log.warn( Context.DEFAULT, this, "File reference is in use. Ignoring." );
				return;
			}

			_observer = observer;
			_fileReference = new FileReference();
			_fileReference.addEventListener( Event.SELECT, onFileHandlingSelect );
			_fileReference.addEventListener( Event.CANCEL, onFileHandlingCancel );
			_fileReference.addEventListener( ProgressEvent.PROGRESS, onFileHandlingProgress );
			_fileReference.addEventListener( IOErrorEvent.IO_ERROR, onFileHandlingIOError );
			_fileReference.addEventListener( SecurityErrorEvent.SECURITY_ERROR, onFileHandlingSecurityError );
			_fileReference.addEventListener( HTTPStatusEvent.HTTP_STATUS, onFileHandlingHttpStatusError );

			_progress = 0.0;

			onInitiate( _fileReference );
		}

		/**
		 * Clean up.
		 */
		protected final function expire():void
		{
			if( _fileReference == null )
			{
				Log.warn( Context.DEFAULT, this, "File reference is null. Ignoring." );
				return;
			}

			onExpire( _fileReference );

			_fileReference.removeEventListener( Event.SELECT, onFileHandlingSelect );
			_fileReference.removeEventListener( Event.CANCEL, onFileHandlingCancel );
			_fileReference.removeEventListener( ProgressEvent.PROGRESS, onFileHandlingProgress );
			_fileReference.removeEventListener( IOErrorEvent.IO_ERROR, onFileHandlingIOError );
			_fileReference.removeEventListener( SecurityErrorEvent.SECURITY_ERROR, onFileHandlingSecurityError );
			_fileReference.removeEventListener( HTTPStatusEvent.HTTP_STATUS, onFileHandlingHttpStatusError );
			_fileReference = null;
			_observer = null;
		}

		/**
		 * Dispatch a fail event.
		 */
		public final function fail( error:String ):void
		{
			_observer.onDialogFailure( this, error );

			expire();
		}

		/**
		 * Close the file dialog.
		 */
		public final function close( type:int ):void
		{
			_observer.onDialogAction( this, type );

			expire();
		}

		/**
		 * Set the progress to be dispatched.
		 */
		public final function setProgress( value:Number ):void
		{
			_progress = value;

			_observer.onDialogAction( this, FileDialogActionType.PROGRESS );
		}

		/**
		 * @private
		 */
		private function onFileHandlingSelect( event:Event ):void
		{
			onSelected( _fileReference );
		}

		/**
		 * @private
		 */
		private function onFileHandlingProgress( event:ProgressEvent ):void
		{
			setProgress( event.bytesLoaded / event.bytesTotal );
		}

		/**
		 * @private
		 */
		private function onFileHandlingCancel( event:Event ):void
		{
			close( FileDialogActionType.CANCEL );
		}

		/**
		 * @private
		 */
		private function onFileHandlingSecurityError( event:SecurityErrorEvent ):void
		{
			fail( "Security Error. " + event );
		}

		/**
		 * @private
		 */
		private function onFileHandlingIOError( event:IOErrorEvent ):void
		{
			fail( "IO Error. " + event );
		}

		/**
		 * @private
		 */
		private function onFileHandlingHttpStatusError( event:HTTPStatusEvent ):void
		{
			fail( "Http Status Error. HttpStatus:" + event.status );
		}

		/**
		 * The native file handle held by the file dialog.
		 */
		protected function get fileReference():FileReference
		{
			return _fileReference;
		}

		/**
		 * Returns true if the file dialog is open; false otherwise.
		 */
		public function isOpen():Boolean
		{
			return ( _fileReference != null );
		}

		/**
		 * The progress of the file dialog action.
		 */
		public function get progress():Number
		{
			return _progress;
		}

		/**
		 * Means to identify the current file dialog.
		 */
		public function get id():int
		{
			return _id;
		}

		/**
		 * Means to identify the current file dialog.
		 */
		public function set id( value:int ):void
		{
			_id = value;
		}

		/**
		 * Creates and returns a string representation of the FileDialog object.
		 */
		public function toString():String
		{
			return "[FileDialog]";
		}
	}
}