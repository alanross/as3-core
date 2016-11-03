package com.ar.core.notification.signals
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public interface ISignalReceiver
	{
		/**
		 *
		 */
		function onSignal( signalType:int, signalSource:ISignalSource ):void
	}
}