package com.ar.core.file
{
	import flash.events.Event;
	import flash.net.FileReference;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class FileSaveDialog extends FileDialog
	{
		private var _fileData:*;
		private var _fileName:String;

		/**
		 * Creates a new instance of FileSaveDialog.
		 */
		public function FileSaveDialog()
		{
		}

		/**
		 * open the FileSaveDialog.
		 */
		public function open( observer:IFileDialogObserver, fileData:*, fileName:String = null ):void
		{
			_fileData = fileData;
			_fileName = fileName;

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
				fileReference.save( _fileData, _fileName );
			}
			catch( error:Error )
			{
				fail( error.message );
			}
		}

		/**
		 * @inheritDoc
		 */
		override protected function onExpire( fileReference:FileReference ):void
		{
			fileReference.removeEventListener( Event.COMPLETE, onFileHandlingComplete );

			_fileData = null;
			_fileName = null;
		}

		/**
		 * @private
		 */
		private function onFileHandlingComplete( event:Event ):void
		{
			close( FileDialogActionType.SAVE_COMPLETE );
		}

		/**
		 * Creates and returns a string representation of the FileSaveDialog object.
		 */
		override public function toString():String
		{
			return "[FileSaveDialog]";
		}
	}
}