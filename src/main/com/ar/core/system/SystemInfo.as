package com.ar.core.system
{
	import com.ar.core.error.NullError;
	import com.ar.core.error.SingletonError;

	import flash.display.Stage;
	import flash.system.Capabilities;
	import flash.system.System;
	import flash.utils.describeType;

	/**
	 * Provides basic information about the system and flash player.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class SystemInfo
	{
		private static const UNKNOWN:String = "Unknown";
		private static const UNDEFINED:int = -1;

		private static var _instance:SystemInfo;

		private var _version:String = UNKNOWN;
		private var _debugPlayer:Boolean = false;
		private var _platform:String = UNKNOWN;
		private var _major:int = UNDEFINED;
		private var _minor:int = UNDEFINED;
		private var _build:int = UNDEFINED;
		private var _internalBuild:int = UNDEFINED;
		private var _swfUrl:String = UNKNOWN;
		private var _swfShortUrl:String = UNKNOWN;

		private var _stage:Stage;

		/**
		 * Creates an instance of SystemInfo and initializes it.
		 */
		public static function initialize( stage:Stage ):void
		{
			if( _instance != null )
			{
				throw new SingletonError( "SystemInfo" );
			}

			if( stage == null )
			{
				throw new NullError( "stage can not be null." );
			}

			_instance = new SystemInfo( new Lock(), stage );
		}

		/**
		 * Returns the single instance of SystemInfo.
		 */
		public static function get():SystemInfo
		{
			return _instance;
		}

		/**
		 * Returns true if the flash player version is equal or newer than the one provided.
		 */
		public static function greaterEqual( minMajor:int = 10, minMinor:int = 0 ):Boolean
		{
			if( _instance._major > minMajor )
			{
				return true;
			}

			return _instance._major == minMajor && _instance._major >= minMajor;
		}

		/**
		 * Returns detailed information about the flash player.
		 */
		public static function getDetailedPlayerInfo():String
		{
			var result:Array = ["Player Info"];

			const descrXML:XML = describeType( Capabilities );

			const accessors:XMLList = descrXML.accessor;

			const n:int = accessors.length();

			for( var i:int = 0; i < n; ++i )
			{
				const accessor:XML = accessors[i];

				const accessorName:String = accessor.@name;

				if( accessorName != "prototype" && accessorName != "serverString" )
				{
					result.push( accessorName + ": " + Capabilities[accessorName] );
				}
			}

			result.sort();

			var info:String = result.join( "\n" ) + "\n";

			info += "stageWidth: " + stage.stageWidth + "\n";
			info += "stageHeight: " + stage.stageHeight + "\n";
			info += "memory: " + getUsedMemory();
			info += "swf url: " + swfUrl;

			return info;
		}

		/**
		 * Returns basic information about the flash player.
		 */
		public static function getBasicPlayerInfo():String
		{
			return _instance._version;
		}

		/**
		 * Returns the amount of used memory by the flash player.
		 */
		public static function getUsedMemory():String
		{
			return ( System.totalMemory / 1048576.0 ).toFixed( 2.0 ) + " MB";
		}

		/**
		 * Returns the platform the flash player is running on.
		 */
		public static function get platform():String
		{
			return _instance._platform;
		}

		/**
		 * Returns the major version of the player.
		 */
		public static function get major():int
		{
			return _instance._major;
		}

		/**
		 * Returns the minor version of the player.
		 */
		public static function get minor():int
		{
			return _instance._minor;
		}

		/**
		 * Returns the build id of the flash player.
		 */
		public static function get build():int
		{
			return _instance._build;
		}

		/**
		 * Returns the internal build id of the flash player.
		 */
		public static function get internalBuild():int
		{
			return _instance._internalBuild;
		}

		/**
		 * Returns true if the player is a debug player.
		 */
		public static function get isDebugPlayer():Boolean
		{
			return _instance._debugPlayer;
		}

		/**
		 * Returns the url of the loaded swf.
		 */
		public static function get swfUrl():String
		{
			return _instance._swfUrl;
		}

		/**
		 * Returns the short url of the loaded swf.
		 */
		public static function get swfShortUrl():String
		{
			return _instance._swfShortUrl;
		}

		/**
		 * Returns an instance of the stage.
		 */
		public static function get stage():Stage
		{
			return _instance._stage;
		}

		/**
		 * Creates a new instance of SystemInfo.
		 */
		public function SystemInfo( lock:Lock, stage:Stage )
		{
			_stage = stage;

			_version = Capabilities.version;

			const pattern:RegExp = /^(\w*) (\d*),(\d*),(\d*),(\d*)$/;

			const result:Object = pattern.exec( _version );

			if( null != result )
			{
				_platform = result[1];
				_major = result[2];
				_minor = result[3];
				_build = result[4];
				_internalBuild = result[5];
			}

			if( Capabilities.isDebugger )
			{
				_version += "(Debug)";
				_debugPlayer = true;
			}
			else
			{
				_debugPlayer = false;
			}

			_swfUrl = _stage.loaderInfo.loaderURL;
			_swfShortUrl = _swfUrl.substring( _swfUrl.lastIndexOf( "/" ) + 1 );
		}

		/**
		 * Creates and returns a string representation of the SystemInfo object.
		 */
		public function toString():String
		{
			return "[SystemInfo]";
		}
	}
}

class Lock
{
}