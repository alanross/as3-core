package com.ar.core.file
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public interface IFileDialogObserver
	{
		/**
		 * Dispatched on action triggered by the file dialog.
		 */
		function onDialogAction( dialog:FileDialog, actionType:int ):void;

		/**
		 * Dispatched on failures related to the file dialog.
		 */
		function onDialogFailure( dialog:FileDialog, error:String ):void;
	}
}