package com.ar.core.file
{
	import flash.events.Event;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.utils.ByteArray;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class FileLoadDialog extends FileDialog
	{
		private var _filter:FileFilter;
		private var _data:ByteArray;

		/**
		 * Creates a new instance of FileLoadDialog.
		 */
		public function FileLoadDialog()
		{
		}

		/**
		 * Opens the FileLoadDialog.
		 */
		public function open( observer:IFileDialogObserver, filter:FileFilter = null ):void
		{
			_filter = filter;

			initiate( observer );
		}

		/**
		 * @inheritDoc
		 */
		override protected function onInitiate( fileReference:FileReference ):void
		{
			try
			{
				fileReference.addEventListener( Event.COMPLETE, onFileHandlingComplete );

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
			fileReference.load();
		}

		/**
		 * @inheritDoc
		 */
		override protected function onExpire( fileReference:FileReference ):void
		{
			fileReference.removeEventListener( Event.COMPLETE, onFileHandlingComplete );

			_filter = null;
			_data = null;
		}

		/**
		 * @private
		 */
		private function onFileHandlingComplete( event:Event ):void
		{
			_data = fileReference.data;

			close( FileDialogActionType.LOAD_COMPLETE );
		}

		/**
		 * The data of the file held by the FileLoadDialog.
		 */
		public function get data():ByteArray
		{
			return _data;
		}

		/**
		 * Creates and returns a string representation of the FileLoadDialog object.
		 */
		override public function toString():String
		{
			return "[FileLoadDialog]";
		}
	}
}