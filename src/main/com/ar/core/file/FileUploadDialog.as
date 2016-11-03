package com.ar.core.file
{
	import flash.events.DataEvent;
	import flash.events.HTTPStatusEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLRequest;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class FileUploadDialog extends FileDialog
	{
		private var _request:URLRequest;
		private var _filter:FileFilter;
		private var _response:Object;

		/**
		 * Creates a new instance of FileUploadDialog.
		 */
		public function FileUploadDialog()
		{
		}

		/**
		 *
		 */
		public function open( observer:IFileDialogObserver, request:URLRequest, filter:FileFilter = null ):void
		{
			_filter = filter;
			_request = request;

			initiate( observer );
		}

		/**
		 * @inheritDoc
		 */
		override protected function onInitiate( fileReference:FileReference ):void
		{
			try
			{
				if( _filter )
				{
					fileReference.browse( [ _filter ] );
				}
				else
				{
					fileReference.browse();
				}
			}
			catch( error:Error )
			{
				fail( "Unable to browse for files. " + error.message );
			}
		}

		/**
		 * @inheritDoc
		 */
		override protected function onSelected( fileReference:FileReference ):void
		{
			try
			{
				//fileReference.addEventListener( HTTPStatusEvent.HTTP_RESPONSE_STATUS, onHttpResponseStatus );
				fileReference.addEventListener( DataEvent.UPLOAD_COMPLETE_DATA, onUploadDataComplete );
				fileReference.upload( _request );
			}
			catch( error:Error )
			{
				fail( "Unable to upload. " + error.message );
			}
		}

		/**
		 * @inheritDoc
		 */
		override protected function onExpire( fileReference:FileReference ):void
		{
			//fileReference.removeEventListener( HTTPStatusEvent.HTTP_RESPONSE_STATUS, onHttpResponseStatus );
			fileReference.removeEventListener( DataEvent.UPLOAD_COMPLETE_DATA, onUploadDataComplete );

			_filter = null;
			_request = null;
		}

		/**
		 * @private
		 */
		private function onHttpResponseStatus( event:HTTPStatusEvent ):void
		{
			close( FileDialogActionType.UPLOAD_COMPLETE );
		}

		/**
		 * @private
		 */
		private function onUploadDataComplete( event:DataEvent ):void
		{
			_response = event.data;

			close( FileDialogActionType.UPLOAD_COMPLETE );
		}

		/**
		 *
		 */
		public function get response():Object
		{
			return _response;
		}

		/**
		 * Creates and returns a string representation of the FileUploadDialog object.
		 */
		override public function toString():String
		{
			return "[FileUploadDialog]";
		}
	}
}