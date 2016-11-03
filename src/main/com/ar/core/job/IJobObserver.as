package com.ar.core.job
{
	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public interface IJobObserver
	{
		/**
		 * Called upon update in the progress of the job.
		 */
		function onJobProgress( job:IJob, progress:Number ):void;

		/**
		 * Called when the job is completed successfully.
		 */
		function onJobCompleted( job:IJob ):void;

		/**
		 * Called when the job was cancelled.
		 */
		function onJobCancelled( job:IJob ):void;

		/**
		 * Called when the job encountered an error.
		 */
		function onJobFailed( job:IJob, error:Error ):void;
	}
}