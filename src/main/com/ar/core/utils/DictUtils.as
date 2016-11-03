package com.ar.core.utils
{
	import flash.utils.Dictionary;

	/**
	 * A collection of static util functions associated with dictionaries.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class DictUtils
	{
		/**
		 * Returns all keys stored in the given dictionary.
		 */
		public static function getKeys( dictionary:Dictionary ):Array
		{
			var keys:Array = [];

			for( var key:* in dictionary )
			{
				keys.push( key );
			}

			return keys;
		}

		/**
		 * Returns all values stored in the given dictionary.
		 */
		public static function getValues( dictionary:Dictionary ):Array
		{
			var values:Array = [];

			for each ( var value:* in dictionary )
			{
				values.push( value );
			}

			return values;
		}

		/**
		 * Creates a new instance of DictUtils.
		 */
		public function DictUtils()
		{
			throw new Error( "DictUtils class is static container only." );
		}

		/**
		 * Generates and returns the string representation of the DictUtils object.
		 */
		public function toString():String
		{
			return "[DictUtils]";
		}
	}
}