package com.ar.core.utils
{
	import com.ar.core.error.AssertionError;

	/**
	 * Throws an error if given expression evaluates to false.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public function assert( expression:Boolean, failureMessage:String ):void
	{
		if( !expression )
		{
			throw new AssertionError( failureMessage );
		}
	}
}