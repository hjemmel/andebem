package br.com.andebem.components.controls
{
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	import mx.events.FlexEvent;
	import mx.managers.CursorManager;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.TextInput;
	import spark.events.TextOperationEvent;

	[SkinState("prompting")]
	public class SuperTextInput extends TextInput
	{

		[SkinPart(required="false")]
		public var promptDisplay:Label;

		[SkinPart(required="false")]
		public var clearButton:Button;

		private var _prompt:String = '';
		private var _focused:Boolean = false;

		public function SuperTextInput()
		{
			super();

			//watch for programmatic changes to text property
			this.addEventListener(FlexEvent.VALUE_COMMIT, textChangedHandler, false, 0, true);

			//watch for user changes (aka typing) to text property
			this.addEventListener(TextOperationEvent.CHANGE, textChangedHandler, false, 0, true);
		}

		[Bindable]
		public function get prompt():String
		{
			return _prompt;
		}

		public function set prompt(value:String):void
		{
			if(_prompt != value)
			{
				_prompt = value;
				if(promptDisplay != null)
				{
					promptDisplay.text = value;
				}
			}
		}

		private function textChangedHandler(e:Event):void
		{
			if(clearButton)
			{
				clearButton.visible = (text.length > 0);
			}
			invalidateSkinState();
		}

		private function clearClick(e:MouseEvent):void
		{
			text = '';
			dispatchEvent(new TextOperationEvent(TextOperationEvent.CHANGE));
		}

		override protected function focusInHandler(event:FocusEvent):void
		{
			super.focusInHandler(event);
			_focused = true;
			invalidateSkinState();
		}

		override protected function focusOutHandler(event:FocusEvent):void
		{
			super.focusOutHandler(event);
			_focused = false;
			invalidateSkinState();
		}

		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);

			if(instance == promptDisplay)
			{
				promptDisplay.text = prompt;
				promptDisplay.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			}
			else if(instance == clearButton)
			{
				clearButton.addEventListener(MouseEvent.CLICK, clearClick);
				clearButton.visible = (text != null && text.length > 0);
			}
		}

		private function onMouseOver(event:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.IBEAM;
			promptDisplay.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}

		private function onMouseOut(event:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.AUTO;
			promptDisplay.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}

		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);

			if(instance == promptDisplay)
			{
				promptDisplay.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			}
			else if(instance == clearButton)
			{
				clearButton.removeEventListener(MouseEvent.CLICK, clearClick);
			}
		}

		override protected function getCurrentSkinState():String
		{
			if(prompt.length > 0 && text.length == 0 && !_focused)
			{
				return 'prompting';
			}
			return super.getCurrentSkinState();
		}
	}
}