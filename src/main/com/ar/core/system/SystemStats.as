package com.ar.core.system
{
	import com.ar.core.utils.IDisposable;

	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.getTimer;

	/**
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class SystemStats extends TextField implements IDisposable
	{
		private var _fpsInfo:String;
		private var _memInfo:String;
		private var _sysInfo:String;

		private var _fpsCurrent:int;
		private var _fpsTime:int;

		/**
		 * Creates a new instance of SystemStats.
		 */
		public function SystemStats()
		{
			_fpsTime = getTimer();
			_fpsCurrent = 0;

			_sysInfo = SystemInfo.getBasicPlayerInfo();

			defaultTextFormat = new TextFormat( "helvetica", 9, 0, false );
			autoSize = TextFieldAutoSize.LEFT;
			selectable = false;
			multiline = true;
			wordWrap = false;
			background = true;
			backgroundColor = 0xFFFFFF;
			embedFonts = false;
			alpha = 0.6;

			addEventListener( Event.ENTER_FRAME, onEnterFrame );
		}

		/**
		 * Called each frame, calculates and displays the current fps.
		 */
		private function onEnterFrame( event:Event ):void
		{
			if( getTimer() - _fpsTime > 1000 )
			{
				_fpsInfo = _fpsCurrent.toString() + " FPS";
				_memInfo = SystemInfo.getUsedMemory();

				text = _sysInfo + "\n" + _fpsInfo + " \n" + _memInfo;

				_fpsTime = getTimer();
				_fpsCurrent = 0;
			}

			++_fpsCurrent;
		}

		/**
		 * @inheritDoc
		 */
		public function dispose():void
		{
			removeEventListener( Event.ENTER_FRAME, onEnterFrame );

			_fpsInfo = null;
			_memInfo = null;
			_sysInfo = null;
		}

		/**
		 * Creates and returns a string representation of the SystemStats object.
		 */
		override public function toString():String
		{
			return "[SystemStats]";
		}
	}
}