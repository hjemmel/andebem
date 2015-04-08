package br.com.andebem.presentation
{
	import br.com.andebem.model.AppModel;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public class PresentationBase
	{
		[Inject]
		[Bindable]
		public var appModel:AppModel	
		
		private var _dispatcher:IEventDispatcher;

		[Dispatcher]
		public function set dispatcher(value:IEventDispatcher):void
		{
			_dispatcher = value;
		}

		public function swizDispatcher(e:Event):void
		{
				_dispatcher.dispatchEvent(e);
		}
	}
}