package com.ar.core.notification.notifier
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public interface INotifierObserver
	{
		function onNotifierEvent( event:INotifierEvent ):void;
	}
}