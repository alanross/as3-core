package com.ar.core.utils
{
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	/**
	 * Returns the class definition of given object.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public function getClassOf( obj:Object ):Class
	{
		if( obj is Class )
		{
			return Class( obj );
		}
		else
		{
			return Class( getDefinitionByName( getQualifiedClassName( obj ) ) );
		}
	}
}