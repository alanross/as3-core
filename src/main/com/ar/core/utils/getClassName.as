package com.ar.core.utils
{
	import flash.utils.getQualifiedClassName;

	/**
	 * Returns the full name of the class of which the object is an instance of.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public function getClassName( obj:Object ):String
	{
		return getQualifiedClassName( obj ).replace( "::", "." );
	}
}
