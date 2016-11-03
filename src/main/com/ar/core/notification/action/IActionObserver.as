package com.ar.core.notification.action
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public interface IActionObserver
	{
		/**
		 *
		 */
		function onActionEvent( action:Action ):void;
	}
}