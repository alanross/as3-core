package com.ar.core.ui
{
	import com.ar.core.utils.IDisposable;

	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.setTimeout;

	/**
	 * A very basic output view based on the native Textfield.
	 *
	 * @author Alan Ross
	 * @version 0.1
	 */
	public final class SimpleOutput extends TextField implements IDisposable
	{
		private var _text:Array;

		private var _stage:Stage;

		/**
		 * Creates a new instance of SimpleOutput.
		 */
		public function SimpleOutput( stage:Stage, message:String, fontSize:int = 9, fontColor:int = 0xFFFFFF )
		{
			_text = new Array();

			defaultTextFormat = new TextFormat( "verdana", fontSize, fontColor, true );
			autoSize = TextFieldAutoSize.NONE;
			selectable = true;
			multiline = true;
			wordWrap = true;
			background = true;
			backgroundColor = 0x888888;
			embedFonts = false;
			alpha = 0.9;

			_stage = stage;
			_stage.addEventListener( Event.RESIZE, onResizeEvent );
			_stage.addEventListener( Event.RENDER, onRenderEvent );

			doubleClickEnabled = true;
			addEventListener( MouseEvent.DOUBLE_CLICK, onDoubleClick );

			onResizeEvent( null );

			print( message );
		}

		/**
		 * Write a message to the screen.
		 */
		public function print( message:String ):void
		{
			_text.push( message );

			_stage.invalidate();
		}

		/**
		 * Frees all internal references of the object.
		 */
		public function dispose():void
		{
			_text = null;
			_stage = null;
		}

		/**
		 * Handle window resizing.
		 */
		private function onResizeEvent( event:Event ):void
		{
			width = _stage.stageWidth;
			height = _stage.stageHeight;
		}

		/**
		 * Handle render events.
		 */
		private function onRenderEvent( event:Event ):void
		{
			text = _text.join( "\n" );
		}

		/**
		 * Copy the content to the clipboard.
		 */
		private function onDoubleClick( mouseEvent:MouseEvent ):void
		{
			System.setClipboard( _text.join( "\n" ) );

			text = "Copied text to clipboard";

			setTimeout( _stage.invalidate, 700 );
		}

		/**
		 * Creates and returns a string representation of the SimpleOutput object.
		 */
		override public function toString():String
		{
			return "[SimpleOutput]";
		}
	}
}