package br.com.andebem.event
{
	import br.com.andebem.domain.FlexMessageException;
	
	import flash.events.Event;
	
	public class RPCFaultEvent extends Event
	{
		public static const RPC_FAULT_EVENT : String = "rpcFaultEvent";
		
		private var _exception : FlexMessageException;
		
		public function get exception():FlexMessageException
		{
			return _exception;
		}
		
		public function RPCFaultEvent(type:String, exception:FlexMessageException = null,  bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_exception = exception;
		}
		
		public override function clone():Event
		{
			return new RPCFaultEvent(type, exception, bubbles, cancelable);
		}
	}
}