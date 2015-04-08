package br.com.andebem.controller
{
	import br.com.andebem.domain.FlexMessageException;
	import br.com.andebem.event.RPCFaultEvent;
	import br.com.andebem.model.AppModel;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import libutilflex.util.FaultMessageManager;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	
	import org.swizframework.utils.services.ServiceHelper;
	
	public class ControllerBase
	{
		[Inject]
		public var appModel:AppModel;
		
		private var _dispatcher:IEventDispatcher;
		private var _serviceHelper:ServiceHelper;
		
		[Dispatcher]
		public function set dispatcher(value:IEventDispatcher):void
		{
			_dispatcher = value;
		}
		
		[Inject]
		public function set serviceHelper(value:ServiceHelper):void
		{
			_serviceHelper = value;
		}
		
		public function dispatcherSwizEvent(event:Event):void
		{
			_dispatcher.dispatchEvent(event);
		}
		
		public function serviceCall(call:AsyncToken, result:Function, fault:Function = null, handlerArgs:Array = null):AsyncToken
		{
			return _serviceHelper.executeServiceCall(call, result, ((fault !=null) ? fault : defaultFaultHandler), handlerArgs);
		}
		
		protected function defaultFaultHandler(e:FaultEvent):void
		{
			var exception:FlexMessageException;
			
			if (e.fault.rootCause is FlexMessageException)
			{
				exception = FlexMessageException(e.fault.rootCause);
			}
			else
			{
				exception = new FlexMessageException();
				exception.message = FaultMessageManager.getFaultMessage(e);
			}
			
			var evt:RPCFaultEvent = new RPCFaultEvent(RPCFaultEvent.RPC_FAULT_EVENT, exception);
			dispatcherSwizEvent(evt);
		}
	}
}