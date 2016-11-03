package com.ar.core.file
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class FileDialogActionType
	{
		public static const CANCEL:int = 1;
		public static const PROGRESS:int = 2;
		public static const LOAD_COMPLETE:int = 3;
		public static const UPLOAD_COMPLETE:int = 4;
		public static const SAVE_COMPLETE:int = 5;

		/**
		 * Creates a new instance of FileDialogActionType.
		 */
		public function FileDialogActionType()
		{
			throw new Error( "FileDialogActionType class is static container only." );
		}

		/**
		 * Generates and returns the string representation of the FileDialogActionType object.
		 */
		public function toString():String
		{
			return "[FileDialogActionType]";
		}
	}
}