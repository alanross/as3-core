package com.ar.core.process
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public interface IProcess
	{
		/**
		 * Called when start was called on the process.
		 */
		function onProcessStart():void;

		/**
		 * Called the process stopped.
		 */
		function onProcessStop():void;

		/**
		 * Called in each iteration cycle.
		 */
		function onProcessRun():void;

		/**
		 * Return the priority of this process.
		 */
		function getProcessPriority():int
	}
}