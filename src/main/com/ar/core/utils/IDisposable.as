package com.ar.core.utils
{
	/**
	 * A marker interface to allow objects to be disposed by a consistent function call.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public interface IDisposable
	{
		/**
		 * Frees all internal references of the object.
		 */
		function dispose():void;
	}
}
