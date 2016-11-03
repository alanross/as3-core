package com.ar.core.notification.notifier
{
	import com.ar.core.utils.IDisposable;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public interface INotifierEvent extends IDisposable
	{
		function reset():void;

		function toString():String;
	}
}