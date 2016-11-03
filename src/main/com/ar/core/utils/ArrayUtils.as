package com.ar.core.utils
{
	/**
	 * A collection of static util functions associated with arrays.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class ArrayUtils
	{
		/**
		 * Compares to arrays. Returns true if both array are the same length and hold the same values.
		 */
		public static function isEqual( a:Array, b:Array ):Boolean
		{
			if( a.length != b.length )
			{
				return false;
			}

			var n:int = a.length;

			while( --n > -1 )
			{
				if( a[n] != b[n] )
				{
					return false;
				}
			}

			return true;
		}

		/**
		 * Reverses the indexes of given array.
		 */
		public static function reverse( input:Array ):Array
		{
			var start:int = 0;
			var end:int = input.length - 1;

			var tmp:*; // as we do not have a char

			while( start < end )
			{
				tmp = input[start];
				input[start++] = input[end];
				input[end--] = tmp;
			}

			return input;
		}

		/**
		 * The modern version of the Fisher–Yates shuffle runs in O(n)
		 */
		public static function shuffleFisherYates( array:Array ):Array
		{
			const n:int = array.length - 1;

			for( var i:int = n; i > 0; --i )
			{
				//random number between 0 and i
				var j:int = Math.random() * i;

				//swap
				var tmp:* = array[j];
				array[j] = array[i];
				array[i] = tmp;
			}

			return array;
		}

		/**
		 * Shuffle array of size n such that each element has 1/n probability to
		 * remain in its original spot. The best solution has O(n) complexity.
		 */
		public static function shuffle( array:Array ):Array
		{
			var size:int = array.length;

			for( var i:int = 0; i < size; ++i )
			{
				//random number between 0 and size
				var j:int = Math.random() * size;

				if( j != i )
				{
					//swap
					var tmp:* = array[j];
					array[j] = array[i];
					array[i] = tmp;
				}
			}

			return array;
		}

		/**
		 * performs the swapping operation twice. First time to generate all possible
		 * permutations of elements at that level and second time to restore to the original string.
		 * http://n1b-algo.blogspot.com/2009/01/string-permutations.html
		 */
		public static function permute( array:Array ):Vector.<Array>
		{
			var result:Vector.<Array> = new Vector.<Array>();

			internalPermute( array, 0, result );

			return result;
		}

		/**
		 * @private
		 */
		private static function internalPermute( array:Array, d:int, result:Vector.<Array> ):void
		{
			const n:int = array.length;

			if( d == n )
			{
				// clone the result, else vector would only be holding same result multiple times
				result.push( array.concat() );
			}
			else
			{
				for( var i:int = d; i < n; ++i )
				{
					// swap the characters for permutation
					var tmp:* = array[i];
					array[i] = array[d];
					array[d] = tmp;

					internalPermute( array, d + 1, result );

					// undo the swapping for parent call
					tmp = array[i];
					array[i] = array[d];
					array[d] = tmp;
				}
			}
		}

		/**
		 * ArrayUtils class is static container only.
		 */
		public function ArrayUtils()
		{
			throw new Error( "ArrayUtils class is static container only." );
		}

		/**
		 * Creates and returns a string representation of the ArrayUtils object.
		 */
		public function toString():String
		{
			return "[ArrayUtils]";
		}
	}
}