package br.com.andebem.components.controls.autocomplete.event
{
	import flash.events.Event;

	public class AutoCompleteEvent extends Event
	{

		public static const SELECT:String = "select";

		private var _data:Object;

		public function get data():Object
		{
			return _data;
		}

		public function AutoCompleteEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			_data = data;
		}
	}
}