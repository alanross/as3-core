package com.ar.core.utils
{
	import com.ar.core.log.Context;
	import com.ar.core.log.Log;

	/**
	 * Collection of static util functions associated with generic objects.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class ObjectUtils
	{
		/**
		 * Returns true if given object contains a property by the given name
		 */
		public static function hasProperty( obj:Object, property:String ):Boolean
		{
			return ( obj.hasOwnProperty( property ) && obj[ property ] != null );
		}

		/**
		 * Returns a string representation of the object and all of its properties.
		 */
		public static function objToString( obj:Object ):String
		{
			return '{\n' + recursiveObjToString( obj, '\t' ) + '}';
		}

		/**
		 * Merges source object into target object.
		 */
		public static function merge( target:Object, source:Object ):void
		{
			recursiveMerge( target, source );
		}

		/**
		 * @private
		 */
		private static function recursiveObjToString( obj:Object, level:String = '' ):String
		{
			if( obj == null )
			{
				return 'null';
			}

			var str:String = '';
			var nextLevel:String = level + '\t';

			var prop:Object;

			for( var key:String in obj )
			{
				prop = obj[key];

				if( prop is Number || prop is String || prop is Boolean )
				{
					str += nextLevel + key + ' = ' + prop + '\n';
				}
				else if( prop is Object )
				{
					var s:String = recursiveObjToString( prop, nextLevel );

					str += nextLevel + key;
					str += ( ( s.length > 2 ) ? ( '\n' + nextLevel + '{\n' + s + nextLevel + '}' ) : ( ' = ' + s ) ) + '\n';
				}
			}

			return ( str.length > 0 ) ? str : '{}';
		}

		/**
		 * @private
		 */
		private static function recursiveMerge( target:Object, source:Object ):Object
		{
			if( target == null && source == null )
			{
				Log.warn( Context.DEFAULT, 'Merge failed. Target and Source are null.' );
				return target;
			}

			if( target == null )
			{
				Log.warn( Context.DEFAULT, 'Merge failed. Target is null.' );
				return target;
			}

			if( source == null )
			{
				Log.warn( Context.DEFAULT, 'Merge failed. Source is null.' );
				return target;
			}

			for( var key:String in source )
			{
				if( typeof(source[key]) == 'object' )
				{
					if( target[key] == null )
					{
						target[key] = {};
					}

					target[key] = recursiveMerge( target[key], source[key] );
				}
				else
				{
					target[key] = source[key];
				}
			}

			return target;
		}

		/**
		 * ObjectUtils class is static container only.
		 */
		public function ObjectUtils()
		{
			throw new Error( 'ObjectUtils class is static container only' );
		}

		/**
		 * Creates and returns a string representation of the ObjectUtils object.
		 */
		public function toString():String
		{
			return '[ObjectUtils]';
		}
	}
}