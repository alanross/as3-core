package com.ar.core.job
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public interface IJob
	{
		/**
		 * Start the job.
		 */
		function start():void;

		/**
		 * Cancel the job.
		 */
		function cancel():void;

		/**
		 * Returns true if the job is currently running, false otherwise.
		 */
		function isRunning():Boolean;

		/**
		 * Add an observer to be notified of changes to the job status.
		 */
		function addObserver( observer:IJobObserver ):void;

		/**
		 * Remove an given observer from being notified of changes to the job status.
		 */
		function removeObserver( observer:IJobObserver ):void;

		/**
		 * Returns true if given observer is held by the job, false otherwise.
		 */
		function hasObserver( observer:IJobObserver ):Boolean;
	}
}